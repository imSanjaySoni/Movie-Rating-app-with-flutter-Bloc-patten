import 'package:movieapp/data/model/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class MovieRepository {
  Future<List<Results>> getMovies();
  Future<List<Results>> getMoviesBySearch(String query);
}

class MovieRepositoryImpl implements MovieRepository {
  var baseUrl = "http://api.themoviedb.org/3/";
  var key = "f9e592bb82b33db7094aeffd4f9647b8";

  @override
  Future<List<Results>> getMovies() async {
    var response = await http.get(baseUrl + "movie/upcoming?api_key=$key");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Results> movies = ApiResultModel.fromJson(data).results;
      return movies;
    } else {
      throw Exception();
    }
  }

  Future<List<Results>> getMoviesBySearch(String query) async {
    var response =
        await http.get(baseUrl + "search/movie?api_key=$key&query=$query");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Results> movies = ApiResultModel.fromJson(data).results;
      return movies;
    } else {
      throw Exception();
    }
  }
}

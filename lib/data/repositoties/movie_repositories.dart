import 'package:MOVIES/api_key.dart';
import 'package:MOVIES/data/model/api_cast_model.dart';
import 'package:MOVIES/data/model/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class MovieRepository {
  //Future<List<Results>> getMovies(String movieType);
  Future<List<Results>> getMovies(String movieType);

  Future<List<Results>> getMoviesBySearch(String query);

  Future<List<Cast>> getCastList(String movieId);
}

class MovieRepositoryImpl implements MovieRepository {
  var baseUrl = "http://api.themoviedb.org/3/";
  var key = api_key;

  @override
  Future<List<Results>> getMovies(String movieType) async {
    var response = await http.get(baseUrl + "movie/$movieType?api_key=$key");
    // var response = await http.get(baseUrl + "movie/upcoming?api_key=$key");

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

  Future<List<Cast>> getCastList(String movieId) async {
    var response = await http.get(
        baseUrl + "movie/$movieId?api_key=$key&append_to_response=credits");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Cast> cast = CastAndCrew.fromJson(data).credits.cast;
      return cast;
    } else {
      throw Exception();
    }
  }
}

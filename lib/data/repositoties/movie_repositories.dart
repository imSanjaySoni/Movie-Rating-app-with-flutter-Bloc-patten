import 'package:movieapp/data/model/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class MovieRepository {
  Future<List<Results>> getMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  var url =
      "http://api.themoviedb.org/3/movie/upcoming?api_key=f9e592bb82b33db7094aeffd4f9647b8";
  @override
  Future<List<Results>> getMovies() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Results> movies = ApiResultModel.fromJson(data).results;
      return movies;
    } else {
      throw Exception();
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/data/model/api_result_model.dart';

abstract class MovieState extends Equatable {}

class MovieInitialState extends MovieState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MovieLoadingState extends MovieState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MovieLoadedState extends MovieState {
  List<Results> movies;
  MovieLoadedState({@required this.movies});
  get moviesList => movies;

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MovieErrorState extends MovieState {
  String message;
  MovieErrorState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MovieEvent extends Equatable {}

class FetchMovieEvent extends MovieEvent {
  @override
  // TODO: implement props
  String movieType;
  FetchMovieEvent({@required this.movieType});

  List<Object> get props => [movieType];
}

// class FetchMovieBySearchEvent extends MovieEvent {
//   String query;
//   FetchMovieBySearchEvent({@required this.query});

//   @override
//   // TODO: implement props
//   List<Object> get props => [query];
// }

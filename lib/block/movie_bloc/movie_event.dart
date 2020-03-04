import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {}

class FetchMovieEvent extends MovieEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

// class FetchMovieBySearchEvent extends MovieEvent {
//   String query;
//   FetchMovieBySearchEvent({@required this.query});

//   @override
//   // TODO: implement props
//   List<Object> get props => [query];
// }

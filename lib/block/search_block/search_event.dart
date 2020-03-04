import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SearchEvent extends Equatable {}

class FetchMovieBySearchEvent extends SearchEvent {
  String query;
  FetchMovieBySearchEvent({@required this.query});

  @override
  // TODO: implement props
  List<Object> get props => [query];
}

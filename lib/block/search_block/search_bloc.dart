import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:MOVIES/block/search_block/search_event.dart';
import 'package:MOVIES/block/search_block/search_state.dart';
import 'package:MOVIES/data/model/api_result_model.dart';
import 'package:MOVIES/data/repositoties/movie_repositories.dart';

class SearchMovieBloc extends Bloc<SearchEvent, SearchMovieState> {
  MovieRepository repository;

  SearchMovieBloc({@required this.repository});

  @override
  // TODO: implement initialState
  SearchMovieState get initialState => SearchMovieInitialState();

  @override
  Stream<SearchMovieState> mapEventToState(SearchEvent event) async* {
    // TODO: implement mapEventToState

    if (event is FetchMovieBySearchEvent) {
      yield SearchMovieLoadingState();
      try {
        List<Results> movies = await repository.getMoviesBySearch(event.query);
        yield SearchMovieLoadedState(movies: movies);
      } catch (e) {
        yield SearchMovieErrorState(message: e.toString());
      }
    }
  }
}

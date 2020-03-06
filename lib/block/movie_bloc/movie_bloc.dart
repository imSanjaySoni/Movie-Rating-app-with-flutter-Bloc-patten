import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:MOVIES/block/movie_bloc/movie_state.dart';
import 'package:MOVIES/block/movie_bloc/movie_event.dart';
import 'package:MOVIES/data/model/api_result_model.dart';
import 'package:MOVIES/data/repositoties/movie_repositories.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository repository;

  MovieBloc({@required this.repository});

  @override
  // TODO: implement initialState
  MovieState get initialState => MovieInitialState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    // TODO: implement mapEventToState

    if (event is FetchMovieEvent) {
      yield MovieLoadingState();
      try {
        List<Results> movies = await repository.getMovies(event.movieType);
        yield MovieLoadedState(movies: movies);
      } catch (e) {
        yield MovieErrorState(message: e.toString());
      }
    }
  }
}

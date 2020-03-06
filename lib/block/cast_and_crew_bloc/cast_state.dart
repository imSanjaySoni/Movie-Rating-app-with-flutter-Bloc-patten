import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:MOVIES/data/model/api_cast_model.dart';
import 'package:MOVIES/data/model/api_result_model.dart';

abstract class CastState extends Equatable {}

class CastInitialState extends CastState {
  @override
  List<Object> get props => [];
}

class CastLoadingState extends CastState {
  @override
  List<Object> get props => [];
}

class CastLoadedState extends CastState {
  final List<Cast> casts;
  CastLoadedState({@required this.casts});
  get castList => casts;

  @override
  List<Object> get props => null;
}

class CastErrorState extends CastState {
  final String message;
  CastErrorState({@required this.message});
  @override
  List<Object> get props => null;
}

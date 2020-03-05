import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/block/cast_and_crew_bloc/cast_bloc.dart';
import 'package:movieapp/block/cast_and_crew_bloc/cast_event.dart';
import 'package:movieapp/data/model/api_result_model.dart';

class ErrorScreen extends StatelessWidget {
  final Results movies;
  ErrorScreen(this.movies);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Feild to load!",
            style: TextStyle(
                fontFamily: "Poppins-Medium", fontSize: 18, color: Colors.grey),
          ),
          FlatButton(
              onPressed: () {
                print(movies.id.toString());
                BlocProvider.of<CastBloc>(context).add(
                    FetchCastAndCrewEvent(movieId: (movies.id).toString()));
              },
              child: Text(
                "try again",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Poppins-Bold"),
              ))
        ],
      ),
    );
  }
}

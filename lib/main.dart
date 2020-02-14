import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/block/movie_bloc/movie_bloc.dart';
import 'package:movieapp/block/movie_bloc/movie_event.dart';
import 'package:movieapp/block/movie_bloc/movie_state.dart';
import 'package:movieapp/data/repositoties/movie_repositories.dart';
import 'package:movieapp/screens/home.dart';
import 'package:movieapp/screens/network.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light),
          child: Scaffold(
              backgroundColor: Colors.black,
              body: BlocProvider(
                  create: (context) =>
                      MovieBloc(repository: MovieRepositoryImpl()),
                  builder: (context) =>
                      MovieBloc(repository: MovieRepositoryImpl()),
                  child: MyHomePage())),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex = 0;

  MovieBloc movieBloc;

  @override
  void initState() {
    super.initState();
    movieBloc = BlocProvider.of<MovieBloc>(context);
    movieBloc.add(FetchMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Movies.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: "Poppins-Bold",
                      fontWeight: FontWeight.w700),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {},
                )
              ],
            ),
            tabBar(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child:
                  BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
                if (state is MovieInitialState) {
                  return loading();
                } else if (state is MovieLoadingState) {
                  return loading();
                } else if (state is MovieLoadedState) {
                  print(state.moviesList);
                  return Home(state.movies);
                } else if (state is MovieErrorState) {
                  return NetworkError();
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget tabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          tab(0, "In Threaters"),
          tab(1, "Upcomings"),
          tab(2, "Populers"),
        ],
      ),
    );
  }

  Widget tab(int index, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16),
      child: InkWell(
        onTap: () {
          movieBloc.add(FetchMovieEvent());
          setState(() {
            activeIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  activeIndex == index ? Colors.redAccent : Color(0xFF333333)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins-Light",
                color: activeIndex == index ? Colors.white : Color(0xFF999999),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget loading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

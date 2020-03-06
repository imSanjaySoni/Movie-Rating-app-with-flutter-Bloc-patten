import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MOVIES/data/model/api_result_model.dart';
import 'package:MOVIES/data/model/genre.dart';
import 'package:MOVIES/screens/details.dart';

class Home extends StatelessWidget {
  final List<Results> movies;
  Home(this.movies);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
              color: Colors.transparent,
            ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final List<String> geners = [];

          for (int i = 0; i < movies[index].genreIds.length; i++) {
            geners.add((Genre.getGenre(movies[index].genreIds[i].toString())));
          }

          return Container(
            margin: EdgeInsets.all(4.0),
            height: height * 0.19,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: height * 0.162,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFF1a1c20),
                              Color(0xFF222222),
                            ]),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: height * 0.162 + 16,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  movies[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Medium",
                                      fontWeight: FontWeight.w200,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                ),
                                getTextWidgets(context, geners),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "⭐ ${movies[index].voteAverage}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Poppins-Semibold",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        "  |  ",
                                        style: TextStyle(
                                            color: Colors.white24,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Poppins-Light",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03),
                                      ),
                                    ),
                                    Text(
                                      " ${movies[index].releaseDate}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Poppins-Light",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 0,
                  height: height * 0.19,
                  width: height * 0.16,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Details(movies[index])));
                    },
                    child: Hero(
                      tag:
                          "https://image.tmdb.org/t/p/w1280${movies[index].id}",
                      child: Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: kIsWeb
                              ? Image.network(
                                  "https://image.tmdb.org/t/p/w1280${movies[index].posterPath}",
                                  width: 145,
                                  fit: BoxFit.cover)
                              : CachedNetworkImage(
                                  width: 145,
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/w1280${movies[index].posterPath}",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

Widget getTextWidgets(context, List<String> strings) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < strings.length; i++) {
    list.add(new Text(
      strings[i],
      style: TextStyle(
          color: Colors.white60,
          fontFamily: "Poppins-Light",
          fontSize: MediaQuery.of(context).size.width * 0.033),
    ));
  }
  return new Wrap(runSpacing: 2, spacing: 4, children: list);
}

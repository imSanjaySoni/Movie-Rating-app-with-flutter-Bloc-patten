import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:movieapp/data/model/api_result_model.dart';
import 'package:movieapp/data/model/genre.dart';
import 'package:movieapp/screens/details.dart';

class Home extends StatelessWidget {
  final List<Results> movies;
  Home(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
            height: 165,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: 135,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFF1a1c20),
                              Color(0xFF222222),
                            ]),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 170,
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
                                  movies[index].title.toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Medium",
                                      fontWeight: FontWeight.w200,
                                      fontSize: 17),
                                ),
                                getTextWidgets(geners),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "⭐ ${movies[index].voteCount}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Poppins-Semibold",
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        "  |  ",
                                        style: TextStyle(
                                            color: Colors.white24,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Poppins-Light",
                                            fontSize: 12),
                                      ),
                                    ),
                                    Text(
                                      " ${movies[index].releaseDate}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "Poppins-Light",
                                          fontSize: 14),
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
                  height: 165,
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
                        width: 145,
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

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < strings.length; i++) {
    list.add(new Text(
      strings[i],
      style: TextStyle(color: Colors.white60, fontFamily: "Poppins-Light"),
    ));
  }
  return new Wrap(runSpacing: 2, spacing: 4, children: list);
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/api_result_model.dart';
import 'package:movieapp/screens/details.dart';

class Home extends StatelessWidget {
  List<Results> movies;
  Home(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.transparent,
            ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
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
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Medium",
                                      fontWeight: FontWeight.w200,
                                      fontSize: 17),
                                ),
                                Text(
                                  movies[index].releaseDate,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Poppins-Light",
                                      fontSize: 14),
                                ),
                                Text(
                                  "⭐️${movies[index].voteCount}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Poppins-Semibold",
                                      fontSize: 14),
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
                    child: Container(
                      width: 145,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          width: 145,
                          imageUrl:
                              "https://image.tmdb.org/t/p/w1280${movies[index].posterPath}",
                          fit: BoxFit.fill,
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

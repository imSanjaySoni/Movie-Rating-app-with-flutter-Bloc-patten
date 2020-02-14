import 'package:flutter/material.dart';
import 'package:movieapp/data/model/api_result_model.dart';

class Details extends StatelessWidget {
  Results movies;
  Details(this.movies);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.57,
                decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w1280${movies.posterPath}"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.57,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF000000).withOpacity(1),
                          Colors.transparent,
                        ],
                        stops: [
                          0.2,
                          0.4,
                        ]),
                  )),
              Positioned(
                top: 30,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white24),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  movies.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Poppins-Bold",
                      color: Color(0xFFFBFBFB) //Color(0xFF5d59d8)
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Overview",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-Semibold",
                        fontSize: 20)),
                SizedBox(
                  height: 8,
                ),
                Text(movies.overview,
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "Poppins-Reguler",
                        fontSize: 17)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

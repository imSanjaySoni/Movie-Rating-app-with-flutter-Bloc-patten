import 'package:cached_network_image/cached_network_image.dart';
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
                color: Color(0xFF333333),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/w1280${movies.posterPath}",
                  fit: BoxFit.cover,
                  width: double.infinity,
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        geners(),
                        Text("Overview",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Medium",
                                fontSize: 20)),
                        SizedBox(
                          height: 8,
                        ),
                        Text(movies.overview,
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontFamily: "Poppins-Light",
                                fontSize: 17)),
                        Text("Cast & Crue",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Medium",
                                fontSize: 20)),
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Container(
                                            height: 90,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://image.tmdb.org/t/p/w1280${movies.posterPath}"),
                                                    fit: BoxFit.cover),
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    );
                                  })),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget geners() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        runSpacing: 2,
        spacing: 8,
        children: <Widget>[
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                "Horror",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins-Light",
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}

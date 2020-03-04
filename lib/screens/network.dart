import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 160,
            width: 160,
            child: Image.asset(
              "assets/icons/error.png",
            ),
          ),
          Text(
            "Oops..",
            style: TextStyle(
                fontFamily: "Poppins-Bold", fontSize: 24, color: Colors.white),
          ),
          Text(
            "Someting went wrong !\n",
            style: TextStyle(
                fontFamily: "Poppins-Medium", fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

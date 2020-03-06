import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/icons/error.png",
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Oops..",
                style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    fontSize: 24,
                    color: Color(0xfffbfbfbf)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Someting went wrong !\n check your internet connection.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Poppins-Light", fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

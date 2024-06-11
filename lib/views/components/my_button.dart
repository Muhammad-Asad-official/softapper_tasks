import 'package:flutter/material.dart';

Widget MyButton(
        {required String title,
          bool loading = false,
        double height = 60,
        double width = double.infinity,
        double fontSize = 18.0,
          FontWeight fontWeight = FontWeight.w600,
          Color color = Colors.orangeAccent,
          required VoidCallback onPress,
        }) =>
    Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
        ),
          onPressed: onPress,
          child: !loading
        ?Text(
            title,
            style:  TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight),
          )
              :CircularProgressIndicator(color: Colors.white,)),
    );

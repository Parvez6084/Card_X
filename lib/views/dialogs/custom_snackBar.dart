import 'package:flutter/material.dart';

class CustomSnackBar {
 static void toastSnackBar(
      {
       required BuildContext context,
        required Color colors,
        required  String title,
        required  String body,
        required  IconData iconData,
        Function? function
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colors,
        content: Container(
          height: 32,
          child: Stack(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(body),
                  ]),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

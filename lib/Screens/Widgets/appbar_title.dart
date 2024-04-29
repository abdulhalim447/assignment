import 'package:assignment/Theme/text_theme.dart';
import 'package:flutter/material.dart';

Widget appbarTitle(String title) => Text(
      title,
      style: TextThemes.getTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: "Poppins",
          letterSpacing: 0.5),
    );

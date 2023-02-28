import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ColorMange/ColorManger.dart';

ThemeData darkTheme= ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManger.primaryColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  scaffoldBackgroundColor: ColorManger.primaryColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: ColorManger.secondaryColor,
      fontSize: 20,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorManger.primaryColor,
    unselectedItemColor: ColorManger.secondaryColor,
    unselectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    shadowColor: ColorManger.secondaryColor,
    color: ColorManger.primaryColor,
    elevation: 24,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:  BorderSide(
          color: Colors.black38
      ),
    ),
    fillColor: ColorManger.primaryColor,
    hintStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: ColorManger.greyColor,
    ),
    filled: true,
  ),


);
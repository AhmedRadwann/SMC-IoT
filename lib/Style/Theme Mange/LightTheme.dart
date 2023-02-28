import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ColorMange/ColorManger.dart';

ThemeData lightTheme= ThemeData(
  scaffoldBackgroundColor: ColorManger.secondaryColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: ColorManger.primaryColor,
      fontSize: 20,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorManger.secondaryColor,
    unselectedItemColor: ColorManger.redColor,
    unselectedIconTheme: IconThemeData(
      color: Colors.blueAccent,
    ),


  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManger.secondaryColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark,


  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    shadowColor: ColorManger.primaryColor,
    color: ColorManger.secondaryColor,
    elevation: 24,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:  BorderSide(
        color: Colors.grey.shade500,
      ),
    ),
    fillColor: ColorManger.secondaryColor,
    hintStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: ColorManger.greyColor,
    ),
    filled: true,
  ),
);
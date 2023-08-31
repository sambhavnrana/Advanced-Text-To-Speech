import 'package:flutter/material.dart';

class Responsiveness {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;
}

import 'package:Hindustani/home_menu.dart';
import 'package:Hindustani/splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GridView Demo',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        HOME_SCREEN: (BuildContext context) => HomeMenu(),
        //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
      },
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello/pages/login.dart';
import 'package:hello/pages/login1.dart';
import 'package:hello/pages/aboutus.dart';
import 'package:hello/pages/printer.dart';

//import 'package:flutter/services.dart';

//import 'package:hello/pages/login.dart';
//import 'package:world_time_app/pages/choose_location.dart';



void main()
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff87C034).withOpacity(1),
  ));

  runApp(MaterialApp(
      title: "My mark@",
      theme: ThemeData(
        //   primarySwatch: Colors.purple,
        brightness: Brightness.light,
        primaryColor: Color(0xff87C034),
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/home',

      // initialRoute: '/login1',

      routes: {

        '/login': (context) => Login(),
        '/login1': (context) => MyHomePage(),
        '/aboutus': (context) =>  AboutUs(),
        '/printer': (context) => Printer(),
      }
  ));
}
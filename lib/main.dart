import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/Home.dart';
import 'package:flutter_app_2drety/Pages/page1.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';

import 'Pages/page2.dart';
import 'Pages/page3.dart';
import 'login/login_user.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
      //  final size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData(
   
    primaryColor: Color(0XFFF409c74),

colorScheme:ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
  
  ),
      debugShowCheckedModeBanner: false,
      home: OrderMenu(),
    );
  }
}
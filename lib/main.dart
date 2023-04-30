import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/Home.dart';
import 'package:flutter_app_2drety/Pages/page1.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Pages/page2.dart';
import 'Pages/page3.dart';
import 'bloc/cubit.dart';
import 'blocc/bloc_bloc.dart';
import 'login/login_user.dart';
void main() {
   // Bloc.observer  = SimpleBlocObserver();

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

    return   MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
       
      ],
     
      child: MaterialApp(
        theme: ThemeData(
       
      primaryColor: Color(0XFFF409c74),
    
    colorScheme:ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
      
      ),
        debugShowCheckedModeBanner: false,
        home: OrderMenu(),
        
    )
    );
  }
}
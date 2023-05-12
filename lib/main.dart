import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Register/cubit/cubit/register_cubit.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';
import 'package:flutter_app_2drety/blocc/bloc_bloc.dart';
import 'package:flutter_app_2drety/login/Cubit/login_cubit/login_cubit.dart';
import 'package:flutter_app_2drety/login/login_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'OwnerOfRestaurant/Page1.dart';

import 'OwnerOfRestaurant/Page2.dart';
import 'firebase_options.dart';

bool islogin=false;
void main() async {
  // Bloc.observer  = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
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

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: MaterialApp(
          routes: {
            // LoginUser.id :(context) => LoginUser(),
            //     RegisterUser.id:(context) => RegisterUser(),
            // Page1.id:(context) =>  Page1(),
          },
          //initialRoute: LoginUser.id,
          theme: ThemeData(
            primaryColor: const Color(0xfff409c74),
            colorScheme:
                ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
          ),
          debugShowCheckedModeBanner: false,
          home: LoginUser(),
        ));
  }
}





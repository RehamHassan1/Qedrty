import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/Home.dart';
import 'package:flutter_app_2drety/Pages/page1.dart';
import 'package:flutter_app_2drety/Register/cubit/cubit/register_cubit.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app_2drety/login/Cubit/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'OwnerOfRestaurant/Page11.dart';
import 'OwnerOfRestaurant/Page12.dart';
import 'OwnerOfRestaurant/Page13.dart';
import 'OwnerOfRestaurant/Page14.dart';
import 'OwnerOfRestaurant/Page15.dart';
import 'OwnerOfRestaurant/Page16.dart';
import 'OwnerOfRestaurant/Page17.dart';
import 'OwnerOfRestaurant/Page9.dart';
import 'OwnerOfRestaurant/deletepage.dart';
import 'Pages/page2.dart';
import 'Pages/page3.dart';
import 'bloc/cubit.dart';
import 'blocc/bloc_bloc.dart';
import 'firebase_options.dart';
import 'login/login_user.dart';
void main() async {
   // Bloc.observer  = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

    return  
        MultiBlocProvider(
          providers: [
         BlocProvider(create: (context) => LoginCubit(),) ,
         BlocProvider(create: (context) => RegisterCubit(),) ,

          ],
      child: MaterialApp(
        routes: {
          LoginUser.id :(context) => LoginUser(),
          RegisterUser.id:(context) => RegisterUser(),
          Page1.id:(context) => Page1(),
        },
        initialRoute: LoginUser.id,
        theme: ThemeData(
      primaryColor: Color(0XFFF409c74),
    
    colorScheme:ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
      
      ),
        debugShowCheckedModeBanner: false,
        home: RegisterUser(),
        
    )
    );
  }
}
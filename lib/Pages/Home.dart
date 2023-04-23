import 'package:flutter/material.dart';

import 'package:flutter_app_2drety/componant/com.dart';
import 'package:flutter_app_2drety/login/login_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(children: [
        ClipPath(
          clipper: Myclipp(),
          child: Stack(children: [
            Container(
              color: Color(0XFFFff3939),
              height: size.height / 2.7,
            ),
            Center(
                child: Image(
              image: AssetImage('lib/assets/images/قدرتي (1)-PhotoRoom.png'),
              height: size.height / 3.4,
            )),
          ]),
        ),
        Container(
          height: 150,
        ),
        Text(
          "اطلب فطارك من مكانك",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(221, 41, 40, 40)),
        ),
        Text("ووفر جهدك ووقتك",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(221, 41, 40, 40))),
        Container(
          height: 120,
        ),
        Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFFFff3939), width: 2.0),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(100.0),
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginUser();
                }), (route) => false);
              },
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 30.0,
                  color: Color(0XFFFff3939),
                ),
              ),
            ),
          ),
        )
        // IconButton(onPressed: (){}, iconSize: 40,icon: Icon(Icons.arrow_forward_ios_sharp))
      ]),
    );
  }
}

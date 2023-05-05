import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class EiditOrder extends StatefulWidget {
  const EiditOrder({super.key});

  @override
  State<EiditOrder> createState() => _EiditOrderState();
}

class _EiditOrderState extends State<EiditOrder> {
  int currentindx = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Container(
          height: size.height / 18,
        ),
        Stack(children: [
          InkWell(
            onTap: () {}, // Handle your callback.

            splashColor: Colors.brown.withOpacity(0.5),

            child: Ink(
              height: 110,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/images (10).jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //Container(color: Colors.greenAccent,width: 200,height: 110,),
          //    Text("طلب",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
        ]),
        Container(
          height: size.height / 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextF(hinttext: 'اسم القسم', typ: TextInputType.text),

              //// url***********

              TextF(hinttext: 'صورة', typ: TextInputType.url),
            ],
          ),
        ),
        Container(
          height: size.height / 25,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "حفظ التعديل",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Color(0XFFFff3939),
            primary: Colors.white,
            fixedSize: Size(250, 35),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: SnakeNavigationBar.color(
        //height: 110,
        selectedItemColor: Colors.white,
        snakeViewColor: Color(0XFFFff3939),
        unselectedItemColor: Color(0XFFFff3939),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          )
        ],
        currentIndex: _selectedIndex,

        onTap: (indx) {
          setState(() {
            _selectedIndex = indx;
          });
        },
      ),
    );
  }
}

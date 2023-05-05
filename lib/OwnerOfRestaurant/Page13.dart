import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  int currentindx = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        Container(
          height: sizeh / 18,
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
          height: sizeh / 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: sizew / 28, horizontal: sizeh / 25),
          child: Column(
            children: [
              TextF(hinttext: "اسم الوجبة", typ: TextInputType.text),
              TextF(hinttext: "صورة", typ: TextInputType.url),
              TextF(hinttext: "السعر", typ: TextInputType.number),
              TextF(hinttext: "الوصف", typ: TextInputType.text),
            ],
          ),
        ),
        Myoutlinebutton(
          hinttext: 'اضافة',
          backgroundColor: Color(0XFFFff3939),
        ),
        Container(
          height: sizeh / 9,
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
                /* Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginUser();
                }), (route) => false);*/
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.add,
                  size: 30.0,
                  color: Color(0XFFFff3939),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: sizeh / 37,
        ),
        Text(
          "اضافة وجبة",
          style: TextStyle(
              color: Color(0XFFF409c74),
              fontSize: sizeh / 29,
              fontWeight: FontWeight.bold),
        )
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

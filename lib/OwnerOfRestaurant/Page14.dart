import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class AfterAddMeal extends StatefulWidget {
  const AfterAddMeal({super.key});

  @override
  State<AfterAddMeal> createState() => _AfterAddMealState();
}

class _AfterAddMealState extends State<AfterAddMeal> {
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
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: sizeh / 7,
            child: Row(
              children: [
                const Image(
                    //height: 20,
                    //width: 20,
                    image: AssetImage('lib/assets/images/images (23).jpeg')),
                Container(
                  width: sizew / 20,
                ),
                const Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: sizew / 8,
                ),
                Column(
                  children: [
                    const Text(
                      "طلب وسط",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "فول مدمس بالزيت الحار",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  
                  ],
                )
              ],
            ),
          ),
        ),
          Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: sizeh / 7,
            child: Row(
              children: [
                const Image(
                    //height: 20,
                    //width: 20,
                    image: AssetImage('lib/assets/images/images (23).jpeg')),
                Container(
                  width: sizew / 20,
                ),
                const Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: sizew / 8,
                ),
                Column(
                  children: [
                    const Text(
                      "طلب وسط",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "فول مدمس بالزيت الحار",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  
                  ],
                )
              ],
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

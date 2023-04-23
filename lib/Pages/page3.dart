import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({super.key});

  @override
  State<OrderMenu> createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int _inc = 0;
    bool flage = true;
    return Scaffold(
      body: Column(children: [
        ClipPath(
          clipper: Myclipp(),
          child: Stack(children: [
            Container(
              color: Color(0XFFFff3939),
              height: size.height / 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                  child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )),
            ),
          ]),
        ),
        Container(
          height: size.height / 13,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: size.height / 7,
            child: Row(
              children: [
                Image(
                    //height: 20,
                    //width: 20,
                    image: AssetImage('lib/assets/images/images (14).jpeg')),
                Container(
                  width: size.width / 20,
                ),
                Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 8,
                ),
                Column(
                  children: [
                    Text(
                      "طلب صغير",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "فول مدمس بالزيت الحار",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                                color: Color(0XFFFff3939),
                                Icons.remove_circle_outline_sharp)),
                        Text(
                          "5",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                                color: Color(0XFFFff3939),
                                Icons.add_circle_outline_sharp)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: size.height / 7,
            child: Row(
              children: [
                Image(
                    //height: 20,
                    //width: 20,
                    image: AssetImage('lib/assets/images/images (23).jpeg')),
                Container(
                  width: size.width / 20,
                ),
                Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 8,
                ),
                Column(
                  children: [
                    Text(
                      "طلب وسط",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "فول مدمس بالزيت الحار",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _inc--;
                                print('$_inc');
                              });
                            },
                            icon: Icon(
                                color: Color(0XFFFff3939),
                                Icons.remove_circle_outline_sharp)),
                        Text(
                          '$_inc',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _inc++;
                                print('$_inc');
                              });
                            },
                            icon: Icon(
                                color: Color(0XFFFff3939),
                                Icons.add_circle_outline_sharp)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: size.height / 10,
        ),
        Text(
          "25 ج.م",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140),
          child: Myoutlinebutton(hinttext: 'اطلب'),
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

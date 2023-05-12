import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_2drety/Pages/page2.dart';
import 'package:flutter_app_2drety/Pages/page3.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class VISA extends StatefulWidget {
  const VISA({super.key});

  @override
  State<VISA> createState() => _VISAState();
}

class _VISAState extends State<VISA> {
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
        ClipPath(
          clipper: Myclipp(),
          child: Stack(children: [
            Container(
              color: const Color(0xfffff3939),
              height: size.height / 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                  child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '120ج.م',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Container(
                width: 50,
              ),
              /*Image(
  
                      image:
  
                          AssetImage('lib/assets/images/icons-location.png'),
  
                      height: size.height / 65,
  
                    ), */

              const Text('حسابي',
                  style: TextStyle(fontSize: 26, color: Colors.black)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [

              TextF(hinttext: 'المبلغ', typ: TextInputType.number),
              TextF(hinttext: 'كود', typ: TextInputType.number),
              TextF(
                  hinttext: 'كلمة المرور', typ: TextInputType.visiblePassword),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Myoutlinebutton(
                    hinttext: 'ايداع',
                    backgroundColor: const Color(0xfff409c74),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return  OrderResturant();
                      }));
                    }),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: SnakeNavigationBar.color(
        //height: 110,
        selectedItemColor: Colors.white,
        snakeViewColor: const Color(0xfffff3939),
        unselectedItemColor: const Color(0xfffff3939),
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

import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/profile.dart';
import 'package:flutter_app_2drety/Pages/setting.dart';
import 'package:flutter_app_2drety/Pages/visa.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});
  static String id = 'page1';

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentindx = 0;
  int _selectedIndex = 0;
  List<Widget> pages = [const Profile(), const Setting()];
  List<String> headers = ['Homepage', 'Setting'];
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
        Container(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xfffefe4ce)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const VISA();
              }));
            },
            child: Row(
              children: [
                Image(
                  image: const AssetImage('lib/assets/images/icons8-cash-48.png'),
                  height: size.height / 11,
                ),
                Container(
                  width: size.width / 2,
                ),
                const Text(
                  "ايداع",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xfffefe4ce)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Image(
                    image: const AssetImage('lib/assets/images/icons-location.png'),
                    height: size.height / 11),
                Container(
                  width: size.width / 3.5,
                ),
                const Text(
                  "اكتشف",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: SnakeNavigationBar.color(
   // height: 60,
    selectedItemColor:Colors.white,
    snakeViewColor:const Color(0xfffff3939),
    unselectedItemColor:const Color(0xfffff3939),
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

import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/profile.dart';
import 'package:flutter_app_2drety/Pages/setting.dart';
import 'package:flutter_app_2drety/Pages/visa.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';
import 'Page2.dart';
import 'Page6.dart';
import 'Page7.dart';

class ownerhome extends StatefulWidget {
  const ownerhome({super.key});

  @override
  State<ownerhome> createState() => _ownerhomeState();
}

class _ownerhomeState extends State<ownerhome> {
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
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: Myclipp(),
            child: Stack(children: [
              Container(
                color: Color(0xFFF444444),
                height: sizeh / 4,
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
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1200ج.م',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  width: 50,
                ),
                Text('حسابي',
                    style: TextStyle(fontSize: 26, color: Colors.black)),
              ],
            ),
          ),
          Container(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFefe4ce)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  pagee1();
                }));
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/icons8-bicycle-48.png'),
                    height: sizeh / 11,
                    // width: sizew/30,
                  ),
                  SizedBox(
                    width: sizew / 2,
                  ),
                  Text(
                    "توصيل",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFefe4ce)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  pagee4();
                }));
              },
              child: Row(
                children: [
                  Image(
                      image: AssetImage('lib/assets/images/icons8-cash-48.png'),
                      height: sizeh / 11),
                  SizedBox(
                    width: sizew / 2,
                  ),
                  Text(
                    "سحب",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFefe4ce)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  pagee5();
                }));
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                        'lib/assets/images/قدرتي-PhotoRoom.png-PhotoRoom.png'),
                    height: sizeh / 11,
                  ),
                  Container(
                    width: sizew / 2.4,
                  ),
                  Text(
                    "انشاء قدرة",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFefe4ce)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  VISA();
                }));
              },
              child: Row(
                children: [
                  Image(
                    image:
                        AssetImage('lib/assets/images/icons8-todo-list-48.png'),
                    height: sizeh / 11,
                  ),
                  SizedBox(
                    width: sizew / 2.3,
                  ),
                  Text(
                    "الطلبات",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 60,
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

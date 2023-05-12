import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/profile.dart';
import 'package:flutter_app_2drety/Pages/setting.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';
import 'Page3.dart';
import 'Page5.dart';

class pagee1 extends StatefulWidget {
  const pagee1({super.key});

  @override
  State<pagee1> createState() => _pagee1State();
}

class _pagee1State extends State<pagee1> {
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
      body: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: Myclipp(),
            child: Stack(children: [
              Container(
                color: Color(0xFFF37474f),
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
          Container(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  return const pagee2();
                }));
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/icons8-bicycle-48.png'),
                    height: size.height / 11,
                  ),
                  Container(
                    width: size.width / 3,
                  ),
                  Text(
                    "اضافة توصيل",
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
                    MaterialStateProperty.all<Color>(Color(0xFFFefe4ce)),
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
                      image: AssetImage('lib/assets/images/icons8-close-48.png'),
                      height: size.height / 11),
                  Container(
                    width: size.width / 3,
                  ),
                  Text(
                    "حذف توصيل",
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
                    MaterialStateProperty.all<Color>(Color(0xFFFefe4ce)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const pagee3();
                }));
              },
              child: Row(
                children: [
                  Image(
                      image: AssetImage(
                          'lib/assets/images/icons8-cash-in-hand-48.png'),
                      height: size.height / 11),
                  Container(
                    width: size.width / 2.3,
                  ),
                  Text(
                    "سحب",
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

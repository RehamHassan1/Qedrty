import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/profile.dart';
import 'package:flutter_app_2drety/Pages/setting.dart';
import 'package:flutter_app_2drety/Pages/visa.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';
import 'Page8.dart';

class pagee5 extends StatefulWidget {
  const pagee5({super.key});

  @override
  State<pagee5> createState() => _pagee5State();
}

class _pagee5State extends State<pagee5> {
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
      body: Column(
        children: [
          ClipPath(
            clipper: Myclipp(),
            child: Stack(children: [
              Container(
                color: Color.fromARGB(255, 85, 81, 81),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
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
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 154, 154, 152)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const pagee5();
                    }));
                  },
                  child: Column(
                    children: [
                      Image(
                        image:
                            AssetImage('lib/assets/images/icons8-list-64.png'),
                      ),
                      Text(
                        "تعديل القسم",
                        style: TextStyle(
                            color: Colors.white, fontSize: sizeh / 30),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 40,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 154, 154, 152)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const pagee6();
                    }));
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                            'lib/assets/images/icons8-edit-text-file-48.png'),
                        height: sizeh / 11,
                      ),
                      Container(
                        width: sizew / 4,
                      ),
                      Text(
                        "اضافة قسم",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              /* Container(
                width: 50,
              ),*/
            ],
          ),
          Container(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 154, 154, 152)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const pagee5();
                    }));
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                            'lib/assets/images/icons8-alarm-clock-48.png'),
                        height: sizeh / 11,
                      ),
                      Container(
                        width: sizew / 4,
                      ),
                      Text(
                        "فترة التوصيل",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 154, 154, 152)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const VISA();
                    }));
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                            'lib/assets/images/icons8-close-window-94.png'),
                        height: sizeh / 11,
                      ),
                      Container(
                        width: sizew / 4,
                      ),
                      Text(
                        "حذف القسم",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
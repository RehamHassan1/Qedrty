import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class DeleteOrder extends StatefulWidget {
  const DeleteOrder({super.key});

  @override
  State<DeleteOrder> createState() => _DeleteOrderState();
}

class _DeleteOrderState extends State<DeleteOrder> {
  int currentindx = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    double sizew = MediaQuery.of(context).size.width;
        double sizeh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: Myclipp(),
            child: Stack(children: [
              Container(
                color: Color(0XFFFff3939),
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
            ]),
          ),
          Container(
            height: sizeh / 18,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Stack(children: [
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
              Text(
                "سندوتشات",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Stack(children: [
              InkWell(
                onTap: () {}, // Handle your callback.
      
                splashColor: Colors.brown.withOpacity(0.5),
      
                child: Ink(
                  height: 110,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/images (1).jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "سايب",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Stack(children: [
              InkWell(
                onTap: () {}, // Handle your callback.
      
                splashColor: Colors.brown.withOpacity(0.5),
      
                child: Ink(
                  height: 110,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/images (23).jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //Container(color: Colors.greenAccent,width: 200,height: 110,),
              Text(
                "طلب",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "حذف",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0XFFFff3939),
              primary: Colors.white,
              fixedSize: Size(150, 35),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
            ),
          ),
        ]),
      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/page3.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';

class OrderResturant extends StatefulWidget {
  const OrderResturant({super.key});

  @override
  State<OrderResturant> createState() => _OrderResturantState();
}

class _OrderResturantState extends State<OrderResturant> {
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
      body: Column(
        children: [
          ClipPath(
            clipper: Myclipp(),
            child: Stack(children: [
              Container(
                color: const Color(0xfffff3939),
                height: size.height / 4,
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
          Container(
            height: size.height / 11,
          ),
          Stack(children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  OrderMenu();
              }));
              }, // Handle your callback.

              splashColor: Colors.brown.withOpacity(0.5),

              child: Ink(
                height: 110,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/images/images (10).jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Container(color: Colors.greenAccent,width: 200,height: 110,),
            const Text("سندوتشات",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
          ]),          Container(height: size.height/35,),

           Stack(children: [
            InkWell(
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  OrderMenu();
              }));}, // Handle your callback.

              splashColor: Colors.brown.withOpacity(0.5),

              child: Ink(
                height: 110,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/images/images (1).jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Container(color: Colors.greenAccent,width: 200,height: 110,),
            const Text("سايب",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
          ]),
          Container(height: size.height/35,),
           Stack(children: [
            InkWell(
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  OrderMenu();
              }));}, // Handle your callback.

              splashColor: Colors.brown.withOpacity(0.5),

              child: Ink(
                height: 110,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/images/images (23).jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Container(color: Colors.greenAccent,width: 200,height: 110,),
            const Text("طلب",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
          ])
        ],
      ),
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

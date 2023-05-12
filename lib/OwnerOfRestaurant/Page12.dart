import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/OwnerOfRestaurant/Page13.dart';
import 'package:flutter_app_2drety/OwnerOfRestaurant/Page15.dart';
import 'package:flutter_app_2drety/OwnerOfRestaurant/Page17.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';

class EnterOrder extends StatefulWidget {
  const EnterOrder({super.key});

  @override
  State<EnterOrder> createState() => _EnterOrderState();
}

class _EnterOrderState extends State<EnterOrder> {
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
                image: const DecorationImage(
                  image: AssetImage('lib/assets/images/images (10).jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
          //Container(color: Colors.greenAccent,width: 200,height: 110,),
          //    Text("طلب",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
        ]),
        Container(
          height: sizeh / 7,
        ),
        const Image(image: AssetImage('lib/assets/images/icons8-close-48.png')),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DeleteMeal();
              }));
            },
            child: Text(
              "حذف وجبة",
              style: TextStyle(
                  color: const Color(0xfff409c74),
                  fontSize: sizeh / 30,
                  fontWeight: FontWeight.bold),
            )),
        Container(
          height: sizeh / 20,
        ),
        const Image(
            image:
                AssetImage('lib/assets/images/icons8-edit-text-file-48.png')),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EditingMeal();
            }));
          },
          child: Text(
            "تعديل وجبة",
            style: TextStyle(
                color: const Color(0xfff409c74),
                fontSize: sizeh / 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: sizeh / 20,
        ),
        const Image(image: AssetImage('lib/assets/images/icons8-plus-math-48.png')),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return  AddMeal(auth: FirebaseAuth.instance.currentUser!.uid,);
            }));
          },
          child: Text(
            "اضافة وجبة",
            style: TextStyle(
                color: const Color(0xfff409c74),
                fontSize: sizeh / 30,
                fontWeight: FontWeight.bold),
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

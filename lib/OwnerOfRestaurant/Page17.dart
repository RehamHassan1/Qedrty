import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../componant/com.dart';
import 'Page16.dart';

class EditingMeal extends StatefulWidget {
  const EditingMeal({super.key});

  @override
  State<EditingMeal> createState() => _EditingMealState();
}

class _EditingMealState extends State<EditingMeal> {
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
      body: SingleChildScrollView(
        child: Column(children: [
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
            //Container(color: Colors.greenAccent,width: 200,height: 110,),
            //    Text("طلب",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
          ]),
          Container(
            height: sizeh / 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
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
                   Text(
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
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: sizew / 28, horizontal: sizeh / 25),
            child: Column(
              children: [
                TextF(hinttext: "اسم الوجبة", typ: TextInputType.text),
                TextF(hinttext: "صورة", typ: TextInputType.url),
                TextF(hinttext: "السعر", typ: TextInputType.number),
                TextF(hinttext: "الوصف", typ: TextInputType.text),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AfterEditMeal();
              }));
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xfffff3939),
              fixedSize: const Size(250, 35),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
            ),
            // onChanged:onChange,
            child: Text(
              "تعديل الجبة",
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ]),
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

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../componant/com.dart';
import 'Page14.dart';
import 'Page16.dart';

class AddMeal extends StatefulWidget {
  AddMeal({super.key, required this.auth});
  String auth = FirebaseAuth.instance.currentUser!.uid;
  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  // File fil;
  var price, name, desc;
  final GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  CollectionReference userref = FirebaseFirestore.instance.collection('Users');
  List users = [];
  addData() async {
    // var formdata = formstate.currentState;
    // if (formdata!.validate()) {
    showLoading(context);
    await userref.add({
      "mealName": name,
      "price": price,
      "descripction": desc,
      "userID": FirebaseAuth.instance.currentUser!.uid
    });
    Navigator.of(context).pop();

    //formdata.save();
    // Navigator.of(context).push(AfterAddMeal());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AfterAddMeal();
      }),
    );
    // }
    //print(users);
  }

  int currentindx = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final formkey = GlobalKey<FormState>();

  final mealName = TextEditingController();
  final mealPrice = TextEditingController();
  final mealDescreption = TextEditingController();
  @override
  void initState() {
    addData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
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
              padding: EdgeInsets.symmetric(
                  vertical: sizew / 28, horizontal: sizeh / 25),
              child: Column(
                children: [
                  TextF(
                    hinttext: "اسم الوجبة",
                    controller: mealName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل اسم الوجبة";
                      }
                      return null;
                    },
                    onsave: (val) {
                      name = val;
                    },
                    typ: TextInputType.text,
                  ),
                  TextF(hinttext: "صورة", typ: TextInputType.url),
                  TextF(
                    hinttext: "السعر",
                    controller: mealPrice,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل سعر الوجبة";
                      }
                      return null;
                    },
                    onsave: (val) {
                      price = val;
                    },
                    typ: TextInputType.number,
                  ),
                  TextF(
                    hinttext: "الوصف",
                    controller: mealDescreption,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل الوصف";
                      } else if (value.length < 5)
                        return "يجب على الوصف الا تقل عن 5 احرف";
                      return null;
                    },
                    onsave: (val) {
                      desc = val;
                    },
                    typ: TextInputType.text,
                  ),
                ],
              ),
            ),
            Container(
              height: sizeh / 13,
            ),
            Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xfffff3939), width: 2.0),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100.0),
                  onTap: () async {
                    //    FirebaseAuth.instance.signOut();
                    /* Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginUser();
                    }), (route) => false);*/
                    if (formkey.currentState!.validate()) {
                      await addData();
                    }

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AfterEditMeal();
                    }));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.add,
                      size: 30.0,
                      color: Color(0xfffff3939),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: sizeh / 38,
            ),
            Text(
              "اضافة وجبة",
              style: TextStyle(
                  color: const Color(0xfff409c74),
                  fontSize: sizeh / 30,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
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

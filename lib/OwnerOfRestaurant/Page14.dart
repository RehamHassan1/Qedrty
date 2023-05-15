import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:uuid/uuid.dart';

class AfterAddMeal extends StatefulWidget {
   AfterAddMeal({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String mealname = "MealName";
  final String meal = "meal";
  Future<void> addUserProgamming(
    String uid,
    num price,
    String desc,
    
  ) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(mealname)
          .doc(uid)
          .collection(meal)
          .doc(uuid)
          .set({
        "id": uuid,
        "description": desc,
        "price": price,
      });
    } catch (e) {
      print('e.message');
    }
  }

  
  Future<void> addedProgamming(
      String id,
    num price,
    String desc,
    String name,

  ) async {
    try {
      // var uuid = Uuid().v4();
      await _firestore.collection('Users').doc(id).set(
        {
          //"id": uuid,
          "idman": id,
          'name': name,
          "price": price,
          "description": desc,
        },
      );
    //  update();
    } catch (e) {
      print('e.message');
    }
  }
    Future<void> updatedProgamming(
        String id,
    num price,
    String desc,
    String name,
  ) async {
    try {
      await _firestore.collection('Users').doc(id).update({
    'name': name,
          "price": price,
          "description": desc,
      });
    } catch (e) {
      print('e.message');
    }
  }
  @override
  State<AfterAddMeal> createState() => _AfterAddMealState();
}

class _AfterAddMealState extends State  <AfterAddMeal> {
  int currentindx = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  CollectionReference order = FirebaseFirestore.instance.collection("Users");

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
          height: sizeh / 15,
        ),
        
        
      /*  FutureBuilder(
            future: order.where("userID",
                isEqualTo: FirebaseAuth.instance.currentUser!.uid.get()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.doc.length,
                    itemBuilder: (context, i) {
                      
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: sizeh / 7,
                          child: Row(
                            children: [
                              const Image(
                                  //height: 20,
                                  //width: 20,
                                  image: AssetImage(
                                      'lib/assets/images/images (23).jpeg')),
                              Container(
                                width: sizew / 20,
                              ),
                               Text(
                                "${snapshot.data!.doc[i].data()['price']}",
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
                                    "${snapshot.data!.doc[i].data()['name']}",
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
                      );
                    });
              }
            }),

        
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
                const Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: sizew / 8,
                ),
                const Column(
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
                const Text(
                  "5 ج.م",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: sizew / 8,
                ),
                const Column(
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
        ),*/
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

import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/profile.dart';
import 'package:flutter_app_2drety/Pages/setting.dart';
import 'package:flutter_app_2drety/Pages/visa.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';

class pagee6 extends StatefulWidget {
  const pagee6({super.key});

  @override
  State<pagee6> createState() => _pagee6State();
}

class _pagee6State extends State<pagee6> {
  int currentindx = 0;
  int _selectedIndex = 0;
  List<Widget> pages = [const Profile(), const Setting()];
  List<String> headers = ['Homepage', 'Setting'];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool code = true;
  final usercontroler = TextEditingController();
  final codecontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
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
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextF(
                      hinttext: " اسم القسم",
                      typ: TextInputType.name,
                      controller: usercontroler,
                      validator: (value) {
                        if (value!.isEmpty) return 'برجاء ادخال الاسم';
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextF(
                      hinttext: "صورة",
                      typ: TextInputType.text,
                      controller: codecontroler,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "برجاء اختيار الصورة";
                        else
                          return null;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
              OutlinedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    debugPrint(usercontroler.text);
                    debugPrint(codecontroler.text);
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return pagee6();
                    }), (route) => false);
                  }
                },
                child: Text(
                  "اضافة",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0XFFFff3939),
                  primary: Colors.white,
                  fixedSize: Size(250, 35),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
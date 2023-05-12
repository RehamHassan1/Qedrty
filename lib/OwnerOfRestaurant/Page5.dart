import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Pages/profile.dart';
import 'package:flutter_app_2drety/Pages/setting.dart';
import 'package:flutter_app_2drety/Pages/visa.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../componant/com.dart';
import 'Page7.dart';

class pagee3 extends StatefulWidget {
  const pagee3({super.key});

  @override
  State<pagee3> createState() => _pagee3State();
}

class _pagee3State extends State<pagee3> {
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
    final size = MediaQuery.of(context).size;

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
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextF(
                      hinttext: "الاسم",
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
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextF(
                      hinttext: "الكود",
                      typ: TextInputType.text,
                      controller: codecontroler,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "برجاءانشاء كود";
                        else if (value.length < 8)
                          return "يجب على الكود الا يقل عن 8 احرف";
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
                      return pagee5();
                    }), (route) => false);
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.white,
                    ),
                    Container(
                      width: 50,
                    ),
                    Text(
                      "اكتشف",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '700ج.م',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Container(
                      width: 50,
                    ),
                    Text('علي',
                        style: TextStyle(fontSize: 26, color: Colors.black)),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextF(
                      hinttext: "المبلغ",
                      typ: TextInputType.name,
                      controller: usercontroler,
                      validator: (value) {
                        if (value!.isEmpty) return 'برجاء ادخال المبلغ';
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
                      return pagee5();
                    }), (route) => false);
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.money,
                      size: 30,
                      color: Colors.white,
                    ),
                    Container(
                      width: 55,
                    ),
                    Text(
                      "سحب",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
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
              Container(
                height: 20,
              ),
              Text(
                'الحد الأدنى للسحب 200 ج.م',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
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
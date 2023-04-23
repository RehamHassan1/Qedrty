import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';
import 'package:flutter_app_2drety/componant/com.dart';

import '../Pages/page1.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool pass = true;
  final passcontroler = TextEditingController();
  final usercontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFff3939),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image(
                  image:
                      AssetImage('lib/assets/images/قدرتي (1)-PhotoRoom.png'),
                  height: 340,
                ),
                Container(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.all(5.0),

                  // color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(children: [
                    // Container(height: 150,),
                    TextF(
                      hinttext: "اسم المستخدم",
                      typ: TextInputType.name,
                      controller: usercontroler,
                      validator: (value) {
                        if (value!.isEmpty) return 'ادخل اسم المستخدم';
                        return null;
                      },
                    ),
                    TextF(
                      hinttext: "كلمة المرور",
                      typ: TextInputType.emailAddress,
                      controller: passcontroler,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "ادخل رقم المرور";
                        else if (value.length < 8)
                          return "يجب على كلمة المرور الا تقل عن 8 احرف";
                        return null;
                      },
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        )),
                    Container(
                      height: 30,
                    ),

                    OutlinedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          debugPrint(usercontroler.text);
                          debugPrint(passcontroler.text);
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return Page1();
                          }), (route) => false);
                        }
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0XFFF409c74),
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
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterUser();
                        }));
                      },
                      child: Text(
                        "انشاء حساب",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0XFFF409c74),
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
                      height: 30,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

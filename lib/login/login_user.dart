import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';
import 'package:flutter_app_2drety/componant/com.dart';
import 'package:flutter_app_2drety/login/Cubit/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Pages/page1.dart';

class LoginUser extends StatelessWidget {
  bool pass = true;
  final passcontroler = TextEditingController();
  final usercontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String? email;
  String? passwordd;
  static String id = 'login page';
  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, Page1.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          showsnackBar(context, state.errmassage);
                    isLoading = false;

        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: const Color(0xFFFff3939),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                          'lib/assets/images/قدرتي (1)-PhotoRoom.png'),
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
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(children: [
                        // Container(height: 150,),
                        TextF(
                          hinttext: "اسم المستخدم او البريد الالكتروني",
                          onChange: (data) {
                            email = data;
                          },
                          typ: TextInputType.name,
                          controller: usercontroler,
                          validator: (value) {
                            if (value!.isEmpty) return 'ادخل اسم المستخدم';
                            return null;
                          },
                        ),
                        TextF(
                          hinttext: "كلمة المرور",
                          onChange: (data) {
                            passwordd = data;
                          },
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
                            child: const Text(
                              "هل نسيت كلمة المرور؟",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            )),
                        Container(
                          height: 30,
                        ),

                        OutlinedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).loginUser(
                                  email: email!, password: passwordd!);
                            } 
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0XFFF409c74),
                            primary: Colors.white,
                            fixedSize: const Size(250, 35),
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
                          child: const Text(
                            "انشاء حساب",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0XFFF409c74),
                            primary: Colors.white,
                            fixedSize: const Size(250, 35),
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: passwordd!);
  }
}

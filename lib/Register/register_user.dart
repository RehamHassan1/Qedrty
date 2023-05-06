import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app_2drety/componant/com.dart';

import '../Pages/page1.dart';
import 'cubit/cubit/register_cubit.dart';

class RegisterUser extends StatelessWidget {
  static String id = 'login page';

  final emailcontroler = TextEditingController();
  final usercontroler = TextEditingController();
  final passcontroler = TextEditingController();
  final phonecontroler = TextEditingController();
  final addrcontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? email, username,phone,address;
  String? passwordd;

  RegisterUser({super.key});
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showLoading(context);
        } else if (state is RegisterSuccess) {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, Page1.id);
        } else if (state is RegisterFailure) {
          Navigator.of(context).pop();
          showsnackBar(context, state.errmassage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xfffff3939),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(children: [
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
                  Column(
                    children: [
                      Image(
                        image: const AssetImage(
                            'lib/assets/images/قدرتي (1)-PhotoRoom.png'),
                        height: sizeh / 3,
                      ),
                      /*/ SizedBox(
                  
                          // height: 200,
                          height: size.height / 5,
                        ),*/
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
                              hinttext: "اسم المستخدم",
                              onChange: (data) {
                                username = data;
                              },
                              controller: usercontroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'ادخل اسم المستخدم';
                                }
                                return null;
                              },
                              typ: TextInputType.name),
                          TextF(
                              hinttext: "البريد الالكتروني",
                              onChange: (data) {
                                email = data;
                              },
                              controller: emailcontroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'ادخل بريدك الالكتروني';
                                } else if (emailcontroler.text.contains(".") ==
                                        false ||
                                    emailcontroler.text.contains("@") ==
                                        false) {
                                  return "ادخل البريد الالكتروني الصحيح";
                                }
                                return null;
                              },
                              typ: TextInputType.emailAddress),
                          TextF(
                              hinttext: "كلمة المرور",
                              onChange: (data) {
                                passwordd = data;
                              },
                              typ: TextInputType.visiblePassword,
                              controller: passcontroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ادخل رقم المرور";
                                } else if (value.length < 8)
                                  return "يجب على كلمة المرور الا تقل عن 8 احرف";
                                return null;
                              },
                              sfx: Icons.visibility_off_outlined),
                          TextF(
                              hinttext: "العنوان",
                               onChange: (data) {
                                address = data;
                              },
                              controller: addrcontroler,
                              validator: (value) {
                                if (value!.isEmpty) return 'ادخل عنوانك';
                                return null;
                              },
                              typ: TextInputType.streetAddress),
                          TextF(
                            hinttext: "رقم الهاتف ",
                             onChange: (data) {
                                phone = data;
                              },
                            typ: TextInputType.phone,
                            controller: phonecontroler,
                            validator: (value) {
                              if (value!.isEmpty) return 'ادخل رقم الهاتف';
                              return null;
                            },
                          ),
                          TextF(
                              hinttext: "طريقة الدفع", typ: TextInputType.text),
                          TextF(
                              hinttext: "صورة البطاقة", typ: TextInputType.url),
                          TextF(hinttext: "الغرض", typ: TextInputType.text),
                          Container(
                            // height: 20,
                            height: sizeh / 20,
                          ),

                          OutlinedButton(
                            onPressed: () async {
                    //   UserCredential resp =await RegisterUser();
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                        email: email!, password: passwordd!);
                                        await FirebaseFirestore.instance
        .collection("Users")
        .add({"username": username, "email": email,"address":address,"phone":phone});
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xfff409c74),
                              fixedSize: const Size(250, 35),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                            ),
                            child: const Text(
                              "انشاء حساب",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xfff409c74),
                              fixedSize: const Size(250, 35),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                            ),
                            child: const Text(
                              "انشاء حساب كمدير مطعم",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            //height: 7,
                            height: sizeh / 50,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: passwordd!);
    
  }
}

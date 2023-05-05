import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Register/register_admin.dart';
import 'package:flutter_app_2drety/componant/com.dart';
import 'package:flutter_app_2drety/login/login_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Pages/page1.dart';
import 'cubit/cubit/register_cubit.dart';



class RegisterUser extends StatelessWidget{
    static String id = 'login page';

  final emailcontroler = TextEditingController();
  final usercontroler = TextEditingController();
  final passcontroler = TextEditingController();
  final phonecontroler = TextEditingController();
  final addrcontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String? email;
  String? passwordd;
  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
 if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, Page1.id);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showsnackBar(context, state.errmassage);
                    isLoading = false;

        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: const Color(0xFFFff3939),
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
                                controller: usercontroler,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'ادخل اسم المستخدم';
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
                                  if (value!.isEmpty)
                                    return 'ادخل بريدك الالكتروني';
                                  else if (emailcontroler.text.contains(".") ==
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
                                  if (value!.isEmpty)
                                    return "ادخل رقم المرور";
                                  else if (value.length < 8)
                                    return "يجب على كلمة المرور الا تقل عن 8 احرف";
                                  return null;
                                },
                                sfx: Icons.visibility_off_outlined),
                            TextF(
                                hinttext: "العنوان",
                                controller: addrcontroler,
                                validator: (value) {
                                  if (value!.isEmpty) return 'ادخل عنوانك';
                                  return null;
                                },
                                typ: TextInputType.streetAddress),
                            TextF(
                              hinttext: "رقم الهاتف ",
                              typ: TextInputType.phone,
                              controller: phonecontroler,
                              validator: (value) {
                                if (value!.isEmpty) return 'ادخل رقم الهاتف';
                                return null;
                              },
                            ),
                            TextF(
                                hinttext: "طريقة الدفع",
                                typ: TextInputType.text),
                            TextF(
                                hinttext: "صورة البطاقة",
                                typ: TextInputType.url),
                            TextF(hinttext: "الغرض", typ: TextInputType.text),
                            Container(
                              // height: 20,
                              height: sizeh / 20,
                            ),

                            OutlinedButton(
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                   BlocProvider.of<RegisterCubit>(context).registerUser(
                                  email: email!, password: passwordd!);
                                }

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
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text(
                                "انشاء حساب كمدير مطعم",
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
          ),
        );
      },
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: passwordd!);
  }
}

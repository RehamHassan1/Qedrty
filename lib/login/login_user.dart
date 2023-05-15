import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Register/register_user.dart';
import 'package:flutter_app_2drety/componant/com.dart';
import 'package:flutter_app_2drety/login/Cubit/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../OwnerOfRestaurant/Page1.dart';
import '../Pages/page1.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LoginUser extends StatelessWidget {
  bool pass = true;
  final passcontroler = TextEditingController();
  final usercontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? email;
  String? passwordd;
  static String id = 'login page';
  String? sign;
  LoginUser({super.key});
  Future<Map<String, dynamic>> getUserData() async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    var data = documentSnapshot.data();
    return data!;
  }

  @override
  /*void getdata() async {
    final type = await _firestore.collection('User').get();
    print(type.data());
  }*/

  @override
  Widget build(BuildContext context) {
    CollectionReference user1 = FirebaseFirestore.instance.collection('Users');

    //  final size = MediaQuery.of(context).size;
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    bool istrue = false;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showLoading(context);
        } else if (state is LoginSuccess) {
          istrue = true;
          Navigator.of(context).pop();
          Navigator.pushNamed(context, Page1.id);
        } else if (state is LoginFailure) {
          Navigator.of(context).pop();
          showsnackBar(context, state.errmassage);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor:  Color(0xfffff3939),
        body: FutureBuilder(
            future: FirebaseStorage.instance
                .ref("Users/${FirebaseAuth.instance.currentUser?.uid}")
                .getData(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
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
                                if (value!.isEmpty) {
                                  return "ادخل رقم المرور";
                                } else if (value.length < 8)
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
     await BlocProvider.of<LoginCubit>(context,listen: false)
                                            .loginUser(
                                                email: email!,
                                                password: passwordd!,
                                                );
                                  User? user =
                                      FirebaseAuth.instance.currentUser;
                                  var kk = FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user!.uid)
                                      .get()
                                      .then(
                                          (DocumentSnapshot documentSnapshot) {
                                    if (documentSnapshot.exists) {
                                      print(documentSnapshot.data());
                                      if (documentSnapshot.get("sign as") ==
                                          "User") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Page1(),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ownerhome(),
                                          ),
                                        );
                                  
                                      }
                                    } else {
                                      print(
                                          'Document does not exist on the database');
                                    }
                                  });
                                }

                                /* Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Page1();
                              }));*/
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:  Color(0xfff409c74),
                                fixedSize: const Size(250, 35),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                            Container(
                              height: 30,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: passwordd!);
  }
}

class AuthManager {
  final _firestoreInstance = FirebaseFirestore.instance;

  Widget homePageManager = const Page1();

  Widget manageAuth() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _firestoreInstance
              .collection('Users')
              .doc(snapshot.data?.uid)
              .get()
              .then((DocumentSnapshot docs) {
            final data = docs.data() as Map<String, dynamic>;
            final role = data['sign as'];

            if (role == 'User') {
              homePageManager = const Page1();
            } else if (role == 'Restaurant Owner') {
              homePageManager = const ownerhome();
            }
          });
          return homePageManager;
        } else {
          print('test');
          return LoginUser();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}

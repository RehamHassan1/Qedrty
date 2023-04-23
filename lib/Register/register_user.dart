import 'package:flutter/material.dart';
import 'package:flutter_app_2drety/Register/register_admin.dart';
import 'package:flutter_app_2drety/componant/com.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool pass = true;
  final emailcontroler = TextEditingController();
  final usercontroler = TextEditingController();
  final passcontroler = TextEditingController();
  final phonecontroler = TextEditingController();
  final addrcontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFff3939),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Column(
                children: [
                  Image(
                    image:
                        AssetImage('lib/assets/images/قدرتي (1)-PhotoRoom.png'),
                    height: size.height / 3,
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
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(children: [
                      // Container(height: 150,),
                      TextF(
                          hinttext: "اسم المستخدم",
                          controller: usercontroler,
                          validator: (value) {
                            if (value!.isEmpty) return 'ادخل اسم المستخدم';
                            return null;
                          },
                          typ: TextInputType.name),
                      TextF(
                          hinttext: "البريد الالكتروني",
                          controller: emailcontroler,
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'ادخل بريدك الالكتروني';
                            else if (emailcontroler.text.contains(".") ==
                                    false ||
                                emailcontroler.text.contains("@") == false) {
                              return "ادخل البريد الالكتروني الصحيح";
                            }
                            return null;
                          },
                          typ: TextInputType.emailAddress),
                      TextF(
                          hinttext: "كلمة المرور",
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
                      TextF(hinttext: "طريقة الدفع", typ: TextInputType.text),
                      TextF(hinttext: "صورة البطاقة", typ: TextInputType.url),
                      TextF(hinttext: "الغرض", typ: TextInputType.text),
                      Container(
                        // height: 20,
                        height: size.height / 20,
                      ),

                      OutlinedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            debugPrint(emailcontroler.text);
                            debugPrint(passcontroler.text);
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterAdmin();
                            }), (route) => false);
                          }
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
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "انشاء حساب كمدير مطعم",
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
                        //height: 7,
                        height: size.height / 50,
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
  }
}

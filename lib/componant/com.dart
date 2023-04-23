

import 'package:flutter/material.dart';

Widget TextF({
  required String hinttext,
  IconData? prfx,
  required TextInputType typ,
  IconData? sfx,
  String? Function(String?)? validator,
  TextEditingController? controller,
  bool obsecure = false,
}) {
  return TextFormField(
      keyboardType: typ,
      validator: validator,
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 88, 145, 123)),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black38),
        labelStyle: const TextStyle(
            fontSize: 13, color: Color.fromARGB(255, 102, 165, 141)),
      ));
}

class Myclipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 2 * .3, size.height * 1, size.width * .786,
        size.height * 1.2, size.width, size.height / 2.3);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Widget Myoutlinebutton({
  required String hinttext,
  IconData? prfx,
   TextInputType? typ,
  IconData? sfx,
  String? Function(String?)? validator,
  TextEditingController? controller,
  bool obsecure = false,
}) {
  return OutlinedButton(
    onPressed: () {},
    child: Text(
      hinttext,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
  );
}
/*
Widget clip({
         dynamic  size = MediaQuery.of(context).size;

}){
  return         ClipPath(
          clipper: Myclipp(),
          child: Stack(children: [
            Container(
              color: Color(0XFFFff3939),
              height: size.height / 4,
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
}*/
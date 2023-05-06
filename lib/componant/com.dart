import 'package:flutter/material.dart';

Widget TextF({
  required String hinttext,
  FormFieldSetter<String>? onsave,
  IconData? prfx,
  required TextInputType typ,
  IconData? sfx,
  String? Function(String?)? validator,
  TextEditingController? controller,
  bool obsecure = false,
  Function(String)? onChange,
}) {
  return TextFormField(
    onSaved: onsave,
      keyboardType: typ,
      validator: validator,
      onChanged: onChange,
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
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

  //Function(String)? onChange,
  IconData? sfx,
  String? Function(String?)? validator,
  TextEditingController? controller,
  bool obsecure = false,
  required Color? backgroundColor,
}) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: backgroundColor,
      fixedSize: const Size(250, 35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
    ),
    // onChanged:onChange,
    child: Text(
      hinttext,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

void showsnackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}

showLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Please wait'),
            content: Container(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }


Widget AddItem(BuildContext cxt,int? itemkey) {
 return Padding(
    padding: const EdgeInsets.all(15.0),
    child: SizedBox(
      height: 100,
      child: Row(
        children: [
          const Image(
              //height: 20,
              //width: 20,
              image: AssetImage('lib/assets/images/images (23).jpeg')),
          Container(
            width: 50,
          ),
          const Text(
            "5 ج.م",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 80,
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
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../componant/com.dart';

class VISA extends StatefulWidget {
  const VISA({super.key});

  @override
  State<VISA> createState() => _VISAState();
}

class _VISAState extends State<VISA> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: [
      ClipPath(
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
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '120ج.م',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Container(
              width: 50,
            ),
            /*Image(
  
                      image:
  
                          AssetImage('lib/assets/images/icons-location.png'),
  
                      height: size.height / 65,
  
                    ), */

            Text('حسابي', style: TextStyle(fontSize: 26, color: Colors.black)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            TextF(hinttext: 'المبلغ', typ: TextInputType.number),
            TextF(hinttext: 'كود', typ: TextInputType.number),
            TextF(hinttext: 'كلمة المرور', typ: TextInputType.visiblePassword),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Myoutlinebutton(hinttext: 'ايداع'),
            ),
          ],
        ),
      ),
    ]));
  }
}

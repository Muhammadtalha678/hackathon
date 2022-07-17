import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              // width: 200,
              height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              
              color: Colors.red,
              image: DecorationImage(
                
                image: AssetImage("assets/images/tailor1.png"),)),
            ),
           
              
          ],
        ),
      ],
    );
  }
}
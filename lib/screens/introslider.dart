import 'package:flutter/material.dart';
import 'package:hackathon/screens/intro1.dart';
import 'package:hackathon/screens/intro2.dart';
import 'package:hackathon/screens/intro3.dart';
import 'package:hackathon/screens/intro4.dart';
import 'package:hackathon/screens/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
PageController _Controller = PageController();
bool LastPage = false;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
          PageView(
            // scrollDirection: Axis.vertical,
            controller: _Controller,
            
            onPageChanged: (index){
              setState(() {
                LastPage = (index == 3 );
              });
              
              // print(_Controller);
            },
            children: [
              Intro1(),
              Intro2(),
              Intro3(),
              Intro4(),
              
              
            ],
          ),
           Container(
            alignment: Alignment(0, 0.95),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 GestureDetector(
                   onTap: (){
                     _Controller.jumpToPage(3);
                   },
                   child: Text("Skip",style: TextStyle(fontSize: 20,color: Colors.white),),
                 ),
                 
          //  SizedBox(width: 10,),
              SmoothPageIndicator(controller: _Controller, count: 4,effect: WormEffect(),),
                LastPage?
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text("Done",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ):GestureDetector(
                    onTap: (){
                      _Controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    },
                    child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ) ,
               ],
             ),
           ),
          
        ],
      ),
    );
  }
}
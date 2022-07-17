import 'package:flutter/material.dart';
import 'package:hackathon/screens/login.dart';

class Intro3 extends StatelessWidget {
  const Intro3({ Key? key }) : super(key: key);
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
              color: Colors.lightBlue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/tailor3.png"))),
            ),
            Positioned(
                top:  470,
                left: 24,
                child: TextButton(
                  
                  onPressed: (){},
                   child: Text
                   ("NO ",
                   style: TextStyle(
                    color: Colors.white,
                    fontSize:17.55,
                    fontWeight: FontWeight.bold,
                    
                    )))),
                    Positioned(
                top:  500,
                left: 29,
                child: TextButton(
                  
                  onPressed: (){},
                   child: Text
                   ("Featured",
                   style: TextStyle(
                    color: Colors.red,
                    fontSize:24,
                    fontWeight: FontWeight.bold,
                    
                    )))),
                     Positioned(
                top:  450,
                left: 55,
                height: 70,
                child: TextButton(
                  
                  onPressed: (){},
                   child: Text
                   ("2",
                   style: TextStyle(
                    color: Colors.white,
                    fontSize:51.8421,
                    fontWeight: FontWeight.bold,
                    
                    )))),
                     Positioned(
                top:  530,
                left: 25,
                height: 70,
                child: TextButton(
                  
                  onPressed: (){},
                   child: Text
                   ("Tailored ",
                   style: TextStyle(
                    color: Colors.white,
                    fontSize:51.8421,
                    fontWeight: FontWeight.bold,
                    )))),
                     Positioned(
                top:  583,
                left: 25,
                height: 70,
                child: TextButton(
                  
                  onPressed: (){},
                   child: Text
                   ("Jimmy Chuka exploring new spring\nsweater collection",
                   style: TextStyle(
                    color: Colors.white,
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                    )))),
                     Positioned(
                top:  660,
                height: 70,
                child: FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                color: Colors.transparent,
                 child: Text("Shop Now",style: TextStyle(fontSize: 24,color: Colors.white),))),
             ],
        ),
      ],
    );
  }
}
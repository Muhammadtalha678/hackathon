import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/screens/homepage.dart';
import 'package:hackathon/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = "";
  var password = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future login() async {
      try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailcontroller.text,
    password: passwordcontroller.text,
   
  );
   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin:EdgeInsets.only(top: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Container(
                      height: 100,
                      width: 500,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/tailor5.png"),
                        
                        )
                      ),
                    ),
                  SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80)
                      ),
                      hintText: "Email",
                      label: Text("Email")
                    ),
                    controller: emailcontroller,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }else if(!value.contains('@')){
                        return "please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80)
                      ),
                      hintText: "Password",
                      label: Text("Password")
                    ),
                    controller: passwordcontroller,
                     validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    }
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? Register"),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                      }, icon: Icon(Icons.app_registration_rounded),color: Colors.blue,),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      email = emailcontroller.text; 
                      password = passwordcontroller.text; 
                      login();
                    });
                  }
                }, child: Text("Login",style: TextStyle(fontSize: 20),)
                ,style: ElevatedButton.styleFrom(
                  // shape: Radius.circular(),
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  onSurface: Colors.purple
                ),
                
                )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
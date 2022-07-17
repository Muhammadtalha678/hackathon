
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/screens/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var email = "";
  var password = "";
  var eCode = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
   signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
         password: passwordcontroller.text);
    }on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The passsword provided is too weak");
        setState(() {
         eCode = e.code.toString(); 
          
        });
      }
    }catch (e){
      print(e);
    }
  }
  cleartext(){
    emailcontroller.clear();
    passwordcontroller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
      
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/tailor5.png"),
                      
                      )
                    ),
                  ),
                Text("$eCode",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
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
                SizedBox(height: 10,),
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
                 SizedBox(height:10,),
                
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? Login"),
                      IconButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                      }, icon: Icon(Icons.login),color: Colors.red,),
                    ],
                  ),
                ),
                SizedBox(height:10,),
                ElevatedButton(onPressed: (){
                  // if (_formKey.currentState!.validate()) {
                  //   setState(() {
                  //     email = emailcontroller.text; 
                  //     password = passwordcontroller.text; 
                  //   });
                  // }
                      signup();
                      cleartext();
                }, child: Text("Register",style: TextStyle(fontSize: 20,),)
                ,style: ElevatedButton.styleFrom(
                  // shape: Radius.circular(),
                  primary: Colors.red ,
                  padding: EdgeInsets.symmetric(horizontal:30),
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
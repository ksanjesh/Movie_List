import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:get_storage/get_storage.dart';
import 'package:movie_list/pages/home_page.dart';
import 'package:movie_list/pages/login_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final userdata = GetStorage();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.png")
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(Icons.ad_units,size: 140,color: Colors.white,),
              ),
              Text("Sign Up",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color:Colors.red.withOpacity(0.150),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0,3),
                        )

                      ]
                  ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your full name",
                      labelText: "Full Name",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.150),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0,3),
                        )
                      ]
                  ),
                  child: TextFormField(
                    controller:contactController ,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter your phone no",
                      labelText: "Phone no",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.150),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0,3),
                        )
                      ]
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      labelText: "Email",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.150),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0,3),
                        )
                      ]
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password),

                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){


                if(contactController.text.isNotEmpty&&nameController.text.isNotEmpty&&emailController.text.isNotEmpty&&passwordController.text.isNotEmpty){
                  userdata.write(
                      'contact', contactController.text);
                  userdata.write(
                      'password', passwordController.text);
                  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInPage()));
                    showToastWidget(Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green, // Change the background color here
                      ),
                      child: Text(
                        'Successfully created your Account',
                        style: TextStyle(
                          color: Colors.white, // Change the text color here
                        ),
                      ),
                    ),
                      context: context,
                      animation: StyledToastAnimation.scale,
                      reverseAnimation: StyledToastAnimation.fade,
                      position: StyledToastPosition.top,
                      animDuration: Duration(seconds: 1),
                      duration: Duration(seconds: 4),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.easeInBack,
                    );

                  }



                else{
                  showToastWidget(Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red, // Change the background color here
                    ),
                    child: Text(
                      'enter all the form',
                      style: TextStyle(
                        color: Colors.white, // Change the text color here
                      ),
                    ),
                  ),
                    context: context,
                    animation: StyledToastAnimation.scale,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.top,
                    animDuration: Duration(seconds: 1),
                    duration: Duration(seconds: 4),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.easeInBack,
                  );

                }




              }, child: Text("Register",style : TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text("Already have an Account?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInPage()));
                    },
                    child: Text("Login", style:TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.red)),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      ),
    );
  }
}

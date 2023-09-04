import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:get_storage/get_storage.dart';
import 'package:movie_list/pages/home_page.dart';
import 'package:movie_list/pages/signUp_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/images/movie.png"),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Movie List",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: contactController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Phone no",
                        hintText: "Enter your phone no",
                        fillColor: Colors.red.withOpacity(0.09),
                        filled: true),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Password",
                        hintText: "Enter your password",
                        fillColor: Colors.red.withOpacity(0.09),
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(contactController.text == userdata.read("contact")&& passwordController.text == userdata.read("password")){
                        userdata.write("islogin", true);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      }else{

                        showToastWidget(
                          Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red, // Change the background color here
                          ),
                          child: Text(
                            'Invalid Credential',
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
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have account?"),
                    TextButton(
                        onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

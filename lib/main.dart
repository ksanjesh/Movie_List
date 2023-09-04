import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_list/pages/home_page.dart';
import 'package:movie_list/pages/login_page.dart';
import 'package:movie_list/pages/signUp_page.dart';
Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetStorage().writeIfNull('islogin', false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch:Colors.red
      ),
      home: GetStorage().read('islogin')?HomePage(): LogInPage(),
    );
  }
}
import 'package:cis_health/Login.dart';
import 'package:cis_health/Start.dart';
import 'package:cis_health/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cis_health/SignUp.dart';
import 'package:cis_health/Homescreen.dart';
import 'package:cis_health/AccountProfile.dart';
import 'package:cis_health/Settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

        debugShowCheckedModeBanner: false,
     
      // home: Homepage(
        
      // ),

      initialRoute: '/Start',
      

      routes: {
        '/Login' : (context) => Login(),
        '/SignUp'  : (context) => SignUp(),
        '/Start'  : (context) => Start(),
        '/Homepage' : (context) => Homepage(),
        '/Homescreen' : (context) => Homescreen(),
        '/Account' : (context) => AccountProfile(),
        '/Settings' : (context) => Settings()
      },
      
    );

    
  }
  

  
}

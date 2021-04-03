import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/Login');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF60804d),
                    const Color(0xFF60804d),
                    const Color(0xFF60804d),
                    const Color(0xFF553004)
                  ],
                )),
        child: Column(
        
          children: <Widget> [
           
            SizedBox(height: 100.0),
            Container(
              height: 400,

              alignment: Alignment.topCenter,
              child: Image(image: AssetImage
              ("CisHealthImages/CISHealthLogo.png"),
              fit: BoxFit.contain,
              ),
              
            ),



          // const SizedBox(height: 10),
          RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: navigateToLogin,
            padding: const EdgeInsets.only(left:70,right:70,top:20,bottom:20),
            child: const Text('Get Started',
             style: TextStyle(fontSize: 11,
             color: Colors.white)),
             color: Colors.green[800]
             ),

          ],
        ),
      ),
    );
  }
}
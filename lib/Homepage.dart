import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

final FirebaseAuth _auth = FirebaseAuth.instance;
User user;
bool isLoggedin = false;

checkAuthentification() async{

  _auth.authStateChanges().listen((user) {
    if (user == null)
    {
           Navigator.pushReplacementNamed(context, "/Start");
    }
  });
}

getUser() async{

  User firebaseUser =  _auth.currentUser;
  await firebaseUser?.reload();
  firebaseUser =  _auth.currentUser;

  if(firebaseUser != null)
  {
    setState(() {
      this.user = firebaseUser;
      this.isLoggedin = true;
    });
  }
}

signOut() async{

  _auth.signOut();
}

 navigateToHomescreen()async
{
  WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/Homescreen');
  }); 
}

@override

void initState(){
super.initState();
  this.checkAuthentification();
  this.getUser();
}
@override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green[800],
      ),


     body: Container(
       child: !isLoggedin? CircularProgressIndicator(): 
       
       Column(
         children: <Widget>[

           SizedBox(height: 90.0),

           Container(

            height: 300,
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage("CisHealthImages/CISHealthLogo.png"),
            fit: BoxFit.contain,
          ),
        ),     
            Container(
              child: Text("Hello ${user.displayName}, your sign up was successful.",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,    
              ),),
            ),

           const SizedBox(height: 30.0),

            Container(
              child: Text("You can start using the application now",
              style: TextStyle(
                fontSize: 14.0,   
              ),),
            ),

            const SizedBox(height: 50.0),
           RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: signOut,
            padding: const EdgeInsets.fromLTRB(35,20,35,20),
            child: const Text('Sign Out',
             style: TextStyle(fontSize: 11,
             color: Colors.white)),
             color: Colors.green[800]
             ),
            const SizedBox(height: 20.0),
           RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: () => navigateToHomescreen(),
            padding: const EdgeInsets.fromLTRB(35,20,35,20),
            child: const Text('Continue',
             style: TextStyle(fontSize: 11,
             color: Colors.white)),
             color: Colors.green[800]
             ),
        ],
       ),
     )

    );
  }

 
}


  // RaisedButton(
  //           // mainAxisAlignment : MainAxisAlignment.center,
  //           onPressed: signOut,
  //           padding: const EdgeInsets.fromLTRB(35,20,35,20),
  //           child: const Text('Sign Out',
  //            style: TextStyle(fontSize: 11,
  //            color: Colors.white)),
  //            color: Colors.green[800]
  //            ),
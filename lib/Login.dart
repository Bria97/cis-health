import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';



// class {}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String _email, _password;

checkAuthentication() async
{
  _auth.authStateChanges().listen((user){

    if(user != null)
    {
        
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/');
         });
    }
  });

  @override
  void initState()
  {
    super.initState();
    this.checkAuthentication();
    print('Hello');
  }
}

login() async
{
  if(_formkey.currentState.validate())
  {
_formkey.currentState.save();

try{
  UserCredential user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);

  
}

catch(e)
{
  showError(e.message);
  print(e);
}
  }
}

showError(String errormessage){
  showDialog(
  context: context,
  builder: (BuildContext context)
  {
    return AlertDialog(
      title: Text('ERROR'),
      content: Text(errormessage),

      actions: <Widget>[
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          
          child: Text('OK'))
      ],
    );
  }
  );
}


// Navigation 

// navigateToLogin()async
// {
//   Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
// }

navigateToRegister()async
{
  WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/SignUp');
  }); 
  // Navigator.pushReplacementNamed(context, '/SignUp');
}

navigateToHomescreen()async
{
  WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/Homescreen');
  }); 
}



// UI


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: SingleChildScrollView(
        child: Column(
        
          children: <Widget> [
           
            SizedBox(height: 90.0),
            Container(
              // decoration: new BoxDecoration(
              //   gradient: new LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //       const Color(0xFF60804d),
              //       const Color(0xFF60804d),
              //       const Color(0xFF60804d),
              //       const Color(0xFF553004)
              //     ],
              //   )),
                
              height: 200,

              alignment: Alignment.topCenter,
              child: Image(image: AssetImage
              ("CisHealthImages/CISHealthLogo.png"),
              fit: BoxFit.contain,
              ),
              
            ),

          // Input Form
          Container(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget> [

                  Container(
                    child: TextFormField(
                      validator: (input)
                      {
                        if(input.isEmpty)

                        return '    Enter Email';
                        },


                        decoration: InputDecoration(

                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email)
                        ),
                        onSaved: (input) => _email = input
                      
                    ),
                  ),

                  Container(
                  child: TextFormField(
                      validator: (input)
                      {
                        if(input.length < 6)

                        return '    Provide Minimum of 6 Characters';
                      },
                        decoration: InputDecoration(

                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock)
                        ),
                        obscureText: true,
                        onSaved: (input) => _password = input
                      
                    )
                  ),

                  const SizedBox(height: 20),
          RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: navigateToHomescreen(),
            padding: const EdgeInsets.fromLTRB(70,20,70,20),
            child: const Text('Login',
             style: TextStyle(
            fontSize: 11,
             color: Colors.white)),
             color: Colors.green[800]
             ),

        SizedBox(height: 10.0),
        RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: ()=> navigateToRegister(),
            padding: const EdgeInsets.fromLTRB(35,20,35,20),
            child: const Text('Create New Account',
             style: TextStyle(fontSize: 11,
             color: Colors.white)),
             color: Colors.green[800]
             ),

          SizedBox(height:10.0),
          FlatButton(onPressed: () {},
           child: Text("Forgot Password?",
           style: TextStyle(fontSize: 11)),
           color: Colors.white
           ),

          //  SizedBox(height: 20.0),
          //  SignInButton(Buttons.Google,
          //  text: "Sign up with Google",
          //   onPressed: () {},
            // )
          
                ],
              ),

            ),

          ),
],


          
        ),
      ),
    );
  }
}
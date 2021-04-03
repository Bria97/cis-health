import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _vpass = TextEditingController();

 String _fname, _lname, _email, _password, _vpassword;

//  checkAuthentication() async {

//     _auth.authStateChanges().listen((user) async 
//     {
//       if(user != null)
//       {
//        Navigator.pushReplacementNamed(context, '/Homepage');
//     }
//     }
//     );
//   }



// @override
// void initState(){
//   super.initState();
//   this.checkAuthentication();
// }

signUp()async{

   if(_formKey.currentState.validate())
   {
     _formKey.currentState.save();

     try{
       UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
       if(user!= null) 
       {
          await _auth.currentUser.updateProfile(displayName: _fname);
          
          navigateToHomepage();
       }
     }

   catch(e){
       
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
          FlatButton(
            
            onPressed: (){
              Navigator.of(context).pop();
            }, 
          
          
          child: Text('OK'))
        ],
      );
    }
   );
  }

  navigateToHomepage()async
{
  WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/Homepage');
  }); 
}


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: SingleChildScrollView(
        
        child: Column(
        
          children: <Widget> [
          

            SizedBox(height: 90.0),
    

            Container(
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
              key: _formKey,
              child: Column(
                children: <Widget> [

                  Container(
                    child: TextFormField(
                      validator: (input)
                      {
                        if(input.isEmpty)

                        return 'Enter First Name';
                        },


                        decoration: InputDecoration(

                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.person)
                        ),
                        onSaved: (input) => _fname = input
                      
                    ),
                  ),
                                    Container(
                    child: TextFormField(
                      validator: (input)
                      {
                        if(input.isEmpty)

                        return 'Enter Last Name';
                        },


                        decoration: InputDecoration(

                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person)
                        ),
                        onSaved: (input) => _lname = input
                      
                    ),
                  ),

                  Container(
                    child: TextFormField(
                      validator: (input)
                      {
                        if(input.isEmpty)

                        return 'Enter Email';
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
                      controller: _pass,
                      validator: (input)
                      {
                        if(input.isEmpty)
                          return 'Please enter a password';
                          

                        if(input.length < 6)

                        return 'Provide Minimum of 6 Characters';

                        
                      },
                      
                        decoration: InputDecoration(

                          labelText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock)
                        ),
                        obscureText: true,
                        onSaved: (input) => _password = input
                      
                    )
                  ),

                  Container(
                  child: TextFormField(
                      controller: _vpass,
                      validator: (input)
                      {
                        if(input.isEmpty)
                          return 'Please enter a password';

                        if(input != _pass.text)

                        return 'These passwords do not match. Please try again.';
                      },
                      
                        decoration: InputDecoration(

                          labelText: 'Verify Password',
                          prefixIcon: Icon(Icons.lock)
                        ),
                        obscureText: true,
                        onSaved: (input) => _vpassword = input
                      
                      
                    )
                  ),


        const SizedBox(height: 50.0),
        RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: signUp,
            padding: const EdgeInsets.fromLTRB(35,20,35,20),
            child: const Text('Create New Account',
             style: TextStyle(fontSize: 11,
             color: Colors.white)),
             color: Colors.green[800]
             ),

          
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
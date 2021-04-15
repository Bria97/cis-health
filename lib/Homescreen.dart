import 'package:cis_health/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cis_health/utlis.dart';
import 'package:cis_health/Widgets/bottom_nav_widget.dart';
import 'package:cis_health/Widgets/slider_widget.dart';
import 'package:provider/provider.dart';
import 'package:cis_health/Widgets/checklist.dart';
import 'package:cis_health/Widgets/notifiers.dart';




class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


_showMultipleChoiceDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final _multipleNotifier = Provider.of<MultipleNotifier>(context);
        List<String>list;
        return AlertDialog(
          title: Text('Which symptoms do you posses?'),
          content: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: symptoms
                      .map((e) => CheckboxListTile(
                            title: Text(e),
                            onChanged: (value) {
                              value
                                  ? _multipleNotifier.addItem(e)
                                  : _multipleNotifier.removeItem(e);
                            },
                            value: _multipleNotifier.isHaveItem(e),
                          ))
                      .toList(),
                )),
          ),
          actions: [
            FlatButton(
              child: Text('Complete'),
              onPressed: () => {
              list = _multipleNotifier.selectedItems.toList(),
              Completed(list)
              // Navigator.of(context).pop(),
              }
            )
          ],
        );
      });


showResult(String result, {String title = 'ERROR'}){

   showDialog(
     
    context: context,
    builder: (BuildContext context)
    {
      return AlertDialog(

        title: Text(title),
        content: Text(result),

        actions: <Widget>[
          FlatButton(
            
            onPressed: (){
              Navigator.of(context).popUntil(ModalRoute.withName("/Homescreen"));
            }, 
          
          
          child: Text('OK'))
        ],
      );
    }
   );
  }
  

dynamic Completed (List list) {
  
  if (list.length > 1 && list.contains('None of Above')){
    showResult("You selected None of Above & Symptoms. Select None of Above or select Symptoms");
  } else if (list.length == 0){
    showResult("No symptoms checked.");
  }
  else if (list.length > 2){
    showResult("You are possesing symptoms of COVID-19 and should remain home", title: "Stay Home");
  } else 
  showResult("You're good to go", title: "Perfect!");

}


 navigateToHomescreen()async
{
  WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/Homescreen');
  }); 
}

navigateToAccountProfile()async
{
  WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/Account');
  }); 
}

@override
  Widget build(BuildContext context) {
    return Scaffold(

      
      

      backgroundColor: Color(0xfff28500),
      bottomNavigationBar: BottomNavBarWidget(),
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //      color: Colors.black
        //      ),
        //      onPressed: () {},
        //      ),
        

              title: Text('CIS Health',
              textAlign: TextAlign.center,
              ),
             
             actions: [
               IconButton(
                 icon: Icon(
                   Icons.account_circle_outlined,
                   color: Colors.black,
                   ),
                    onPressed: () => navigateToAccountProfile() 
                    ),
             ],
      ),

        drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Color(0xfff28500),
              ),
            ),
            ListTile(
              title: Text('CIS News'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('COVID-19 News'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Job Postings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Events'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Building Status Log'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

    body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Building Status: Unsafe',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  'Benjamin Banneker Building - A',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: SliderWidget(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),

            const SizedBox(
              height: 35,
            ),
            
          
          RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: () => 
            _showMultipleChoiceDialog (
              // showDialog(
              // context: context, 
                // builder: (BuildContext context) => _showMultipleChoiceDialog(context))
              context
          ),

            padding: const EdgeInsets.only(left:30,right:30,top:20,bottom:20),
            child: const Text('Symptom Checklist',
             style: TextStyle(fontSize: 20,
             color: Colors.white)),
             color: Colors.green[800]
             ),
            
            const SizedBox(
              height: 35,
            ),

          ], 
          
        ),
      ),
      
    );
  }
}

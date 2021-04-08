import 'package:cis_health/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cis_health/utlis.dart';
import 'package:cis_health/Widgets/bottom_nav_widget.dart';
import 'package:cis_health/Widgets/slider_widget.dart';
import 'package:cis_health/Widgets/checklist.dart';
import 'package:provider/provider.dart';
import 'package:cis_health/Widgets/checklist.dart';
import 'package:cis_health/Widgets/notifiers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider<MultipleNotifier>(
      create: (_) => MultipleNotifier([]),),

  ],
  child: MyApp(),
  ));
}
_showMultipleChoiceDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final _multipleNotifier = Provider.of<MultipleNotifier>(context);
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
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });



class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  


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
        leading: IconButton(
          icon: Icon(
            Icons.menu,
             color: Colors.black
             ),
             onPressed: () {},
             ),

              title: Text('CIS Health',
              textAlign: TextAlign.center,
              ),
             
             actions: [
               IconButton(
                 icon: Icon(
                   Icons.account_circle_outlined,
                   color: Colors.black,
                   ),
                    onPressed: navigateToAccountProfile() 
                    ),
             ],
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
                  'Building Status: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
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
            onPressed: () => {},
            // _showMultipleChoiceDialog {
            //   showDialog(
            //     context: context, 
            //     builder: (BuildContext context) => _(context))
            // },
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

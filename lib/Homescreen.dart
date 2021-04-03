import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cis_health/utlis.dart';
import 'package:cis_health/Widgets/bottom_nav_widget.dart';
import 'package:cis_health/Widgets/slider_widget.dart';
import 'package:cis_health/Homepage.dart';
import 'package:cis_health/Widgets/checklist.dart';


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
                    onPressed: () {}
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
              children: [
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Current humidity',
                //       style: TextStyle(
                //         color: Colors.grey.withAlpha(150),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 10,
                //     ),
                //     Text(
                //       '55%',
                //       style: TextStyle(
                //         fontSize: 24,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ],
                // ),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Current temp.',
                //       style: TextStyle(
                //         color: Colors.grey.withAlpha(150),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 10,
                //     ),
                //     Text(
                //       '25°',
                //       style: TextStyle(
                //         fontSize: 24,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            
            // Row(
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Automatic',
            //           style: TextStyle(color: Colors.black, fontSize: 16),
            //         ),
            //         style: ButtonStyle(
            //           elevation: MaterialStateProperty.all(0),
            //           backgroundColor: MaterialStateProperty.all(Colors.white),
            //           padding: MaterialStateProperty.all(
            //             const EdgeInsets.symmetric(
            //                 horizontal: 24, vertical: 16),
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Icon(
            //         Icons.adjust,
            //         color: Colors.black.withAlpha(175),
            //       ),
            //       style: ButtonStyle(
            //         elevation: MaterialStateProperty.all(0),
            //         backgroundColor: MaterialStateProperty.all(Colors.white),
            //         padding: MaterialStateProperty.all(
            //           const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Icon(
            //         Icons.airplay,
            //         color: Colors.black.withAlpha(175),
            //       ),
            //       style: ButtonStyle(
            //         elevation: MaterialStateProperty.all(0),
            //         backgroundColor: MaterialStateProperty.all(Colors.white),
            //         padding: MaterialStateProperty.all(
            //           const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          
          RaisedButton(
            // mainAxisAlignment : MainAxisAlignment.center,
            onPressed: () => _showMultipleChoiceDialog {
              showDialog(
                context: context, 
                builder: (BuildContext context) => _(context),)
            },
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

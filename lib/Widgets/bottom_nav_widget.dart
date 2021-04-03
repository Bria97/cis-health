import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withAlpha(10),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
          border: Border.all(width: 10, color: Colors.green[800]),
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(32),
            // topRight: Radius.circular(32),
          )),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.green[800],
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(icon: Icon(Icons.sms_failed), label: ''),
          // BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.alarm_add_outlined), label: ''),
        ],
        
      ),
    );
  }
}
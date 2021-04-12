import 'package:cloud_firestore/cloud_firestore.dart';


class Data {
  FirebaseFirestore database = FirebaseFirestore.instance;

  Data () {
    database = FirebaseFirestore.instance;
  }

  void Name (String fname, String lname, String uid) {
    database.collection('users').doc(uid).set({'fname':fname,'lname':lname});
  }
}
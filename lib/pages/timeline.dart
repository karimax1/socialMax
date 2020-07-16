import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final userRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    super.initState();
  }

//note: using the FutureBuilder allow you to avoid all the code above//
//note: using StreamBuilder to get real time data
  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        body: StreamBuilder<QuerySnapshot>(
            //future: userRef.getDocuments(),
            stream: userRef.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              // the snapshot here is for to get data if the previous condition is resolved
              final List<Text> children = snapshot.data.documents
                  .map((doc) => Text(doc['username']))
                  .toList();
              return Container(
                child: ListView(
                  children: children,
                ),
              );
            }));
  }
}

// class _TimelineState extends State<Timeline> {
//   @override
//   void initState() {
//     //getUsers();
//     // getUsers();
//     // createUser();
//     // updateUser();
//     // deletUser();
//     super.initState();
//   }

//   // createUser() async {
//   //   await userRef
//   //       .add({"username": 'Kemoula', "postCount": 0, "isAdmin": false});
//   // }

//   // updateUser() async {
//   //   final doc = await userRef.document('3ZnDVXFZ6VHMB9zpYzDf').get();
//   //   if (doc.exists) {
//   //     doc.reference
//   //         .updateData({'username': 'Max', 'postCount': 0, 'isAdmin': false});
//   //   }
//   // }

//   // deletUser() async {
//   //   final DocumentSnapshot doc =
//   //       await userRef.document('3ZnDVXFZ6VHMB9zpYzDf').get();
//   //   if (doc.exists) {
//   //     doc.reference.delete();
//   //   }
//   // }

//   // getUserById() async {
//   //   final String id = "MIWaobkAgD0IANqq9410";
//   //   final DocumentSnapshot doc = await userRef.document(id).get();
//   //   print(doc.data);
//   //   print(doc.documentID);
//   //   print(doc.exists);
//   // }

//   // getUsers() async {
//   //   final QuerySnapshot snapshot = await userRef.getDocuments();
//   //   //to get the data in the scaffold
//   //   setState(() {
//   //     users = snapshot.documents;
//   //   });
//   // }

// //note: using the FutureBuilder allow you to avoid all the code above//
// //note: using StreamBuilder to get real time data
//   @override
//   Widget build(context) {
//     return Scaffold(
//         appBar: header(context, isAppTitle: true),
//         body: StreamBuilder<QuerySnapshot>(
//             //future: userRef.getDocuments(),
//             stream: userRef.snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return circularProgress();
//               }
//               // the snapshot here is for to get data if the previous condition is resolved
//               final List<Text> children = snapshot.data.documents
//                   .map((doc) => Text(doc['username']))
//                   .toList();
//               return Container(
//                 child: ListView(
//                   children: children,
//                 ),
//               );
//             }));
//   }
// }

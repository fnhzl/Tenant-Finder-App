import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenantfinderapp/pages/loginpage.dart';
import 'package:tenantfinderapp/pages/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 247, 141, 54)),
      child: Center(
          child: Column(children: <Widget>[
        SizedBox(height: 150),
        Container(
            child: Text(
          "Home Page",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 30),
        )),
        Container(
            child: ElevatedButton(
          child: const Text("Profile"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            });
          },
        )),
        SizedBox(width: 10),
        Container(
            child: ElevatedButton(
          child: const Text("Log Out", textAlign: TextAlign.center),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
        )),
      ])),
    ));
  }
}

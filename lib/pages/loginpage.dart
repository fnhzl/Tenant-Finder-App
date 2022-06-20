import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenantfinderapp/pages/homepage.dart';
import 'package:tenantfinderapp/pages/signuppage.dart';
import 'package:tenantfinderapp/reusable_widgets/reusable_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color.fromARGB(255, 247, 141, 54)),
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.height * 0.2, 20, 0),
        child: Column(children: <Widget>[
          logoWidget("assets/images/tenantfinderlogo.png"),
          SizedBox(
            height: 30,
          ),
          reusableTextField(
              "Email", Icons.person_outline, false, _emailTextController),
          SizedBox(
            height: 20,
          ),
          reusableTextField(
              "Password", Icons.lock_outline, true, _passwordTextController),
          SizedBox(
            height: 20,
          ),
          signInSignUpButton(context, true, () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                .then((value) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });
          }),
          signUpOption()
        ]),
      )),
    ));
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Don't hace account?", style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

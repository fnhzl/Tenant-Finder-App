import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenantfinderapp/pages/homepage.dart';
import 'package:tenantfinderapp/reusable_widgets/reusable_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _fullnameTextController = TextEditingController();
  TextEditingController _phonenumTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 141, 54),
          elevation: 0,
          title: Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color.fromARGB(255, 247, 141, 54)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      reusableTextField("Full Name", Icons.person_outline,
                          false, _fullnameTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Email", Icons.mail_outline, false,
                          _emailTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                          "Mobile Number",
                          Icons.local_phone_outlined,
                          false,
                          _phonenumTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Password", Icons.lock_outline, true,
                          _passwordTextController),
                      SizedBox(
                        height: 20,
                      ),
                      signInSignUpButton(context, false, () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          print("Created New Account");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }),
                      Column(
                        children: <Widget>[
                          Text('By continuing you agree to the',
                              style: TextStyle(color: Colors.white)),
                          TextButton(
                            child: Text(
                              'Terms of Use and Privacy Policy',
                            ),
                            onPressed: () {
                              //signup screen
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ])))));
  }
}

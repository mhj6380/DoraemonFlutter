import 'package:doraemon/globalfunction.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:doraemon/providers/auth.dart';
import 'package:doraemon/api/auth.service.dart';
import 'package:doraemon/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold( 
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/gradientBackground.jpg'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                        top: 55,
                        left: 30,
                        child: Text(
                          "Welcome :)\nHAKGU APP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("gesture1");
                      },
                      child: Container(
                        height: 55,
                        child: Stack(children: [
                          Text(
                            "로그인",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 24,
                            child: Container(
                              width: 10,
                              height: 10,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ), 
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<Auth>(context, listen: false).changeAuthPath("register");
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        height: 55,
                        child: Stack(children: [
                          Text(
                            "회원가입",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex("#cecece")),
                          ),
                          
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "email",
                      labelText: "email",
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      print(value);
                      _fieldFocusChange(_formKey.currentContext, emailFocusNode,
                          passwordFocusNode);
                    },
                    focusNode: emailFocusNode,
                    controller: emailTextController,
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password",
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      passwordFocusNode.unfocus();
                    },
                    focusNode: passwordFocusNode,
                    controller: passwordTextController,
                  )),
              Container(
                padding: EdgeInsets.all(30),
                child: GestureDetector(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: HexColor.fromHex("#333333"),
                      child: Center(
                          child: Text(
                        "로그인",
                        style: TextStyle(
                            color: HexColor.fromHex("#ffffff"), fontSize: 16),
                      )),
                    ),
                    onTap: () {
                      print("Request Login!");
                      print(emailTextController.text);
                      print(passwordTextController.text);

                      final auth = new AuthService();
                      auth
                          .login(emailTextController.text,
                              passwordTextController.text)
                          .then((value) => print("두근두근"));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

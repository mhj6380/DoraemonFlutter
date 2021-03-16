import 'package:doraemon/globalfunction.dart';
import 'package:doraemon/providers/auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:doraemon/providers/auth.dart';
import 'package:doraemon/api/auth.service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 

  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
 FocusNode passwordConfirmFocusNode;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
 TextEditingController passwordConfirmTextController = TextEditingController();

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
                       Provider.of<Auth>(context, listen: false).changeAuthPath("login");
                      },
                      child: Container(
                        height: 55,
                        child: Stack(children: [
                          Text(
                            "로그인",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: HexColor.fromHex("#cecece")),
                          ),
                          // Positioned(
                          //   bottom: 10,
                          //   left: 24,
                          //   child: Container(
                          //     width: 10,
                          //     height: 10,
                          //     color: Colors.black,
                          //   ),
                          // )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("gesture1");
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
                                ),
                          ),
                          Positioned(
                              bottom:10,
                              left:30,
                              child: Container(
                              width:10,
                              height:10,
                             color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "이메일을 입력해주세요.",
                      labelText: "이메일",
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
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "비밀번호를 입력해주세요.",
                      labelText: "비밀번호",
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
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "비밀번호를 한번 더 입력해주세요.",
                      labelText: "비밀번호 확인",
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      passwordConfirmFocusNode.unfocus();
                    }, 
                    focusNode: passwordConfirmFocusNode,
                    controller: passwordConfirmTextController,
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
                        "회원가입",
                        style: TextStyle(
                            color: HexColor.fromHex("#ffffff"), fontSize: 16),
                      )),
                    ),
                    onTap: () {
                    
                      if(passwordTextController.text != passwordConfirmTextController.text){
                          print("비밀번호와 비밀번호 확인이 같지 않습니다.");
                          return;
                      }

                      final auth = new AuthService();
                      auth
                          .register(emailTextController.text,
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

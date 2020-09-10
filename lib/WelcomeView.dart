import 'package:flutter/material.dart';
import 'package:hodom_task/main.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: backgroundImage()),
          child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildText(45, 'اهلاً بك في هدوم', Colors.white),
                  dividerLine(),
                  addHeightSizedBox(30),
                  LoginButtonBuilder(),
                  addHeightSizedBox(30),
                  FaceBookButtonBuilder(),
                  addHeightSizedBox(100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

DecorationImage backgroundImage() {
  return DecorationImage(
    image: AssetImage('images/woman-standing.jpg'),
    fit: BoxFit.cover,
  );
}

Text buildText(double fontSize, String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Lalezar',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}

SizedBox dividerLine() {
  return SizedBox(
    width: 100,
    child: Divider(
      thickness: 5,
      color: Colors.white,
    ),
  );
}

SizedBox addHeightSizedBox(double height) {
  return SizedBox(height: height);
}

class LoginButtonBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: buildText(25, 'تسجيل الدخول كمتسوق', Colors.black),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(ScreenRoutes.loginView);
        },
      ),
    );
  }
}

class FaceBookButtonBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText(25, 'تسجيل دخول كعميل عبر الفيسبوك', Colors.white),
            SizedBox(
              width: 30,
            ),
            Image.asset('images/facebook.png'),
          ],
        ),
        color: Colors.transparent,
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Facebook button pressed"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

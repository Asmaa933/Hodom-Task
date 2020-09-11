import 'package:flutter/material.dart';
import 'package:hodom_task/WidgetsBuilder.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CloseButtonBuilder(),
            addHeightSizedBox(150),
            Center(
              child: buildText(35, 'تسجيل الدخول', Colors.black),
            ),
            addHeightSizedBox(30),
            CheckAuth(),
          ],
        ),
      ),
    );
  }
}

class CloseButtonBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createCloseButton(context);
  }
}

Widget createCloseButton(BuildContext context) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
    child: FlatButton(
      child: Image.asset(
        'images/close.png',
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  String phone;
  String password;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          buildText(20, 'رقم الهاتف', Colors.black),
          TextField(
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              phone = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '+20 123 456 7896',
            ),
          ),
          addHeightSizedBox(10),
          buildText(20, 'كلمة المرور', Colors.black),
          TextField(
            textAlign: TextAlign.end,
            obscureText: !this.showPassword,
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'ادخل كلمة المرور',
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: this.showPassword ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() => this.showPassword = !this.showPassword);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: buildText(17, 'هل نسيت كلمة المرور؟', Colors.black),
          ),
          addHeightSizedBox(60),
          Container(
            width: double.infinity,
            color: Colors.black,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () {
                signInForUser(context, phone, password);
              },
              child: buildText(25, 'تسجيل الدخول', Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

void signInForUser(BuildContext context, String phone, String password) {
  print('user' + phone);
  print('pass' + password);
}

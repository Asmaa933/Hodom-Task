import 'package:flutter/material.dart';
import 'package:hodom_task/WidgetsBuilder.dart';
import 'package:hodom_task/api/HttpClient.dart';
import 'package:hodom_task/models/LoginModel.dart';

import '../main.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            closeButtonBuilder(context),
            addHeightSizedBox(80),
            Center(
              child: buildText(40, 'تسجيل الدخول', Colors.black),
            ),
            addHeightSizedBox(20),
            CheckAuth(),
          ],
        ),
      ),
    );
  }

  Widget closeButtonBuilder(BuildContext context) {
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
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  String phone = '';
  String password = '';
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: buildText(20, 'رقم الهاتف', Colors.black),
          ),
          TextField(
            textAlign: TextAlign.end,
            keyboardType: TextInputType.numberWithOptions(),
            onChanged: (value) {
              phone = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'ادخل كلمة المرور',
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: this.showPassword ? Colors.black : Colors.grey,
                ),
                onPressed: () {
                  setState(() => this.showPassword = !this.showPassword);
                },
              ),
            ),
          ),
          addHeightSizedBox(5),
          Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              onPressed: () {
                showAlertDialog(context, 'Action', 'Forget password pressed');
              },
              child: buildText(17, 'هل نسيت كلمة المرور؟', Colors.black),
            ),
          ),
          addHeightSizedBox(40),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.black,
            ),
            child: FlatButton(
              onPressed: () {
                signInForUser();
              },
              child: buildText(25, 'تسجيل الدخول', Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void signInForUser() async {
    if (phone.isEmpty || password.isEmpty) {
      showAlertDialog(context, 'خطأ', 'يجب ادخال رقم الهاتف وكلمة المرور');
    } else {
      var data = await HttpClient().checkAuth(phone, password);
      if (data['status'] == 200) {
        //todo
        var successLogin = LoginModel.fromJson(data);
        print(
            'name: ${successLogin.result.user.name} \n email: ${successLogin.result.user.email}');
        Navigator.of(context).pushNamed(ScreenRoutes.homeView);
      } else {
        var errorLogin = Status.fromJson(data);
        showAlertDialog(context, 'خطأ', errorLogin.message);
        //remove to pass not having cred
        //  Navigator.of(context).pushNamed(ScreenRoutes.homeView);
      }
    }
  }
}

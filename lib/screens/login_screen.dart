// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, implementation_imports, unused_import, unnecessary_import, use_key_in_widget_constructors

import 'package:apppersonel/constants/api.dart';
import 'package:apppersonel/models/user.dart';
import 'package:apppersonel/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:apppersonel/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ApiProvider apiProvider = ApiProvider();

  final formKey = GlobalKey<FormState>();
  User user = User();
  bool isLogin = false;

  @override
  void initState() {
    _chkLogin();
    super.initState();
  }

  Future _chkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(API.ISLOGIN);
    if (result != null) {
      setState(() {
        isLogin = result;
      });
    }
  }

  bool? _rememberMe = false;
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ชื่อเข้าใช้งาน',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: user.Email,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'K2D',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'กรุณาใส่ชื่อเข้าใช้งาน',
              hintStyle: kHintTextStyle,
            ),
            onSaved: (String? value) => user.Email = value!,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'รหัสผ่าน',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            initialValue: user.Password,
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'กรุณาใส่รหัสผ่าน',
              hintStyle: kHintTextStyle,
            ),
            onSaved: (String? value) => user.Password = value!,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          // ignore: avoid_print
          onPressed: () => print('Forgot Password Button Pressed'),
          child: Text(
            'Forgot Password?',
            style: kLabelStyle,
          )),
    );
  }

  Widget _buildRememberMeCheckbox() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: _rememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                _rememberMe = value;
              });
            },
          ),
        ),
        Text(
          'Remember me',
          style: kLabelStyle,
        ),
      ]),
    );
  }

  void _buildShow(String? result) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.yellowAccent,
              title: Text('$result'),
              content: Text(
                  'ตรวจสอบชื่อเข้าใช้งาน,รหัสผ่าน \nEmail : ${user.Email}\nPassword : ${user.Password}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Close'),
                  child: const Text('Close'),
                ),
              ],
            ));
  }

  void _buildLogin() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      FocusScope.of(context).requestFocus(FocusNode());
      var result = await NetworkService().login(user);
      print(result);
      if (result == "เข้าสุ่ระบบสำเร็จ") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(API.ISLOGIN, true);
        print("ผ่าน");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/test');
      } else {
        print('ไม่ผ่าน');
        _buildShow(result);
      }
    }
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _buildLogin,
        child: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 250, 250),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'K2D',
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  // ignore: unused_element
  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return Column(
      children: [
        Text(
          'ถ้าเกิดปัญหาในการลงชื่อเข้าใช้งาน',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'K2D',
          ),
        ),
       
        Text(
          'กรุณาติดต่อเจ้าหน้าที่',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'K2D',
          ),
        )
      ],
    );
    // GestureDetector(
    //   // ignore: avoid_print
    //   onTap: () => print('Sign Up Button Pressed'),
    //   child: RichText(
    //     text: TextSpan(
    //       children: [
    //         TextSpan(
    //           text: 'ถ้าเกิดปัญหาในการลงชื่อเข้าใช้งาน ',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 18.0,
    //             fontWeight: FontWeight.w400,
    //           ),
    // //         ),

    //         TextSpan(
    //           text: 'กรุณาติดต่อเจ้าหน้าที่',
    // style: TextStyle(
    //   color: Colors.white,
    //   fontSize: 18.0,
    //   fontWeight: FontWeight.bold,
    // ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ยินดีต้อนรับ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'K2D',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        _buildEmailTF(),
                        const SizedBox(height: 30.0),
                        _buildPasswordTF(),
                        const SizedBox(height: 30.0),
                        _buildLoginBtn(),
                        const SizedBox(height: 30.0),
                        _buildSignupBtn(),
                      ],
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

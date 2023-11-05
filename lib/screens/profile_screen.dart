// ignore_for_file: use_key_in_widget_constructors, implementation_imports, prefer_const_constructors, duplicate_ignore, unused_field, unused_import, unnecessary_import, use_build_context_synchronously, non_constant_identifier_names, unused_local_variable

import 'package:apppersonel/screens/ReportLeaveScreen.dart';
import 'package:apppersonel/screens/academicScreen.dart';
import 'package:apppersonel/screens/activity.dart';
import 'package:apppersonel/screens/addressScreen.dart';
import 'package:apppersonel/screens/arrestScreen.dart';
import 'package:apppersonel/screens/childScreen.dart';
import 'package:apppersonel/screens/educationScreen.dart';
import 'package:apppersonel/screens/faAndmoScreen.dart';
import 'package:apppersonel/screens/insigniaScreen.dart';
import 'package:apppersonel/screens/managementScreen.dart';
import 'package:apppersonel/screens/marriageScreen.dart';
import 'package:apppersonel/screens/petition.dart';
import 'package:apppersonel/screens/petitionScreen.dart';
import 'package:apppersonel/screens/salaryScreen.dart';
import 'package:apppersonel/screens/travelScreen.dart';
import 'package:apppersonel/screens/work.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../convert/token.dart';
import '../convert/user.dart';
import '../services/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:apppersonel/constants/api.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _data;
  Token? _token;
  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);
    final user = prefs.getString('user');
    setState(() {
      _token = tokenFromJson(user.toString());
    });
  }

  Future<void> Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.remove('token');
    final user = prefs.remove('user');
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    final Url = API.BASE_IMAGE;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        
        title: const Text(
          'ข้อมูลเบื้องต้น',
          style: TextStyle(
            fontFamily: 'K2D',
            color: Colors.black
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue[100],
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('ออกจากระบบ'),
                content: const Text('คุณต้องการออกจากระบบ หรือ ไม่ '),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('ไม่'),
                  ),
                  TextButton(
                    onPressed: () => Logout(),
                    child: const Text('ใช่'),
                  ),
                ],
              ),
            ),
            child: Icon(
              Icons.logout,
              size: 50,
              color: Colors.black
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 211,
              child: Column(
                children: [
                  // LinearProgressIndicator(),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${Url}${_token?.data.field}"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${_token != null ? _token?.data.titlename : ''} ${_token?.data.userName} ${_token?.data.userLastname}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'K2D',
                    ),
                  ),
                  Text(
                    '${_token?.data.email}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'K2D'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 40),
              width: double.infinity,
              height: 455,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.grey[100]),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'ข้อมูลครอบครัว',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'K2D',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FaAndMoScreen(id: "${_token?.data.id}"),
                                // ChildScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.family_restroom,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'พ่อ - เเม่',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChildScreen(id: "${_token?.data.id}"),
                                // ChildScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.child_care,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'บุตร',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MarriageScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.favorite_rounded,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'การสมรส',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddressScreen(
                                        id: "${_token?.data.id}")));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.home,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'ที่อยู่อาศัย',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'ข้อมูลทางการ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'K2D',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EducationScreen(
                                        id: "${_token?.data.id}")));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.menu_book,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'การศึกษา',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WorkScreen(id: "${_token?.data.id}")));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.work,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'การทำงาน',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Activity(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                Icons.local_activity,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'กิจกรรมพิเศษ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ArrestScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                            const  Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'การฟ้องศาล',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TravelScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                            const  Icon(
                                Icons.travel_explore,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'ไปต่างประเทศ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SalaryScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                             const Icon(
                                Icons.attach_money,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'เงินเดือน',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ManageScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                            const  Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'ตำเเหน่งบริหาร',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AcademicScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                            const  Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'ตำเเหน่งวิชาการ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                  fontSize: 13,
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InsigniaScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                             const Icon(
                                Icons.branding_watermark,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'เครื่องราชฯ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                  fontSize: 13,
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Petition(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                             const Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'ยื่นคำร้อง',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                  fontSize: 13,
                                ),
                              )
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, '/activity',
                            //     arguments: _token?.data.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReportLeaveScreen(id: "${_token?.data.id}"),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.2)),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                            const  Icon(
                                Icons.luggage,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const Text(
                                'การลา',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                  fontSize: 13,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

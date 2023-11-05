// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/screens/academicDetail.dart';
import 'package:apppersonel/screens/academicScreen.dart';
import 'package:apppersonel/screens/addressScreen.dart';
import 'package:apppersonel/screens/arrestScreen.dart';
import 'package:apppersonel/screens/childScreen.dart';
import 'package:apppersonel/screens/educationDetail.dart';
import 'package:apppersonel/screens/educationScreen.dart';
import 'package:apppersonel/screens/faAndmoScreen.dart';
import 'package:apppersonel/screens/insigniaScreen.dart';
import 'package:apppersonel/screens/login_screen.dart';
import 'package:apppersonel/screens/managementScreen.dart';
import 'package:apppersonel/screens/marriageScreen.dart';
import 'package:apppersonel/screens/profile_screen.dart';
import 'package:apppersonel/screens/educations.dart';
import 'package:apppersonel/screens/activity.dart';
import 'package:apppersonel/screens/salaryDetail.dart';
import 'package:apppersonel/screens/salaryScreen.dart';
import 'package:apppersonel/screens/test.dart';
import 'package:apppersonel/screens/travelScreen.dart';
import 'package:apppersonel/screens/work.dart';
import 'package:apppersonel/services/network_service.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:apppersonel/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:apppersonel/screens/petitionScreen.dart';
import 'package:apppersonel/screens/ReportLeaveDetail.dart';
import 'package:apppersonel/screens/ReportLeaveScreen.dart';
import 'package:apppersonel/screens/leaveScreen.dart';
import 'package:apppersonel/screens/petition.dart';
 import 'dart:io';
void main() async {
   HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //  @override
  //   void initState() {
  //     getToken();
  //     super.initState();
  //   }

  //   Future getToken()async{
  //     final data = await NetworkService().getByToken();
  //   }

  @override
  Widget build(BuildContext context) {
    // NetworkService().getByToken();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/test': (context) => MyWidget(),
        '/education': (context) => Education(),
        '/activity': (context) => Activity(id: ""),
        '/work': (context) => WorkScreen(id: ""),
        '/arrest': (context) => ArrestScreen(id: ""),
        '/marrige': (context) => MarriageScreen(id: ""),
        '/child': (context) => ChildScreen(id: ""),
        '/educationscreen': (context) => EducationScreen(id: ""),
        '/address': (context) => AddressScreen(id: ""),
        '/travel': (context) => TravelScreen(id: ""),
        '/salary': (context) => SalaryScreen(id: ""),
        '/manage': (context) => ManageScreen(id: ""),
        '/academic': (context) => AcademicScreen(id: ""),
        '/insignia': (context) => InsigniaScreen(id: ""),
        '/faandmo': (context) => FaAndMoScreen(id: ""),
        '/educationdetail': (context) => EducationDetail(id: ""),
        '/salarydetail': (context) => SalaryDetail(id: ""),
        '/detailAcademic': (context) => DetailAcademic(id: ""),
        '/petitionScreen': (context) => PetitionScreen(),
        '/reportLeaveScreen': (context) => ReportLeaveScreen(id: ""),
        '/reportLeaveDetail': (context) => ReportLeaveDetail(id: ""),
        '/leaveScreen': (context) => LeaveScreen(id: ""),
        '/petition': (context) => Petition(id: ""),
      },
    );
  }
}

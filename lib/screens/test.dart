// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 185, 243),
      body: Column(
        children: [
          Text(
            '',
            style: TextStyle(height: 7),
          ),
          Center(
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_V9t630.json')),
          Text(
            'ยินดีต้อนรับ',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'K2D',
            ),
          ),
          Text(
            '',
            style: TextStyle(height: 5),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/profile'),
            child: Text('ไปต่อ',
                style: TextStyle(
                  fontFamily: 'K2D',
                  fontSize: 20,
                  color: Color.fromARGB(255, 250, 250, 250),
                )),
          ),
        ],
      ),
    );
  }
}

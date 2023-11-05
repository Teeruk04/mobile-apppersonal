// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class PetitionScreen extends StatefulWidget {
  const PetitionScreen({super.key});

  @override
  State<PetitionScreen> createState() => _PetitionScreenState();
}

class _PetitionScreenState extends State<PetitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary1,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text(
            'ประวัติการยื่นคำร้อง',
            style: TextStyle(fontFamily: 'K2D'),
          ),
        ),
        body: getTable());
  }

  Widget getTable() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              DataTable(columns: [
                DataColumn(
                    label: Text(
                  'ประเภทการลา',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'ลาเเล้ว',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'เหลืออีก',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text(
                    'ลาพักผ่อน',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text('0')),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    'ลาป่วย',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text('0')),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    'ลาคลอด',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text('0')),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    'ลาช่วยเหลือภริยา',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text('0')),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    'ลาอุปสมบท',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text('0')),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    'ลาไปถือศีล',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text('0')),
                ]),
              ]),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text("ประวัติการลา"),
              ),
              Center(
                child: Lottie.network(
                    "https://assets2.lottiefiles.com/packages/lf20_WAMQ5G.json"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTable2() {
    return Text("tst");
  }
}

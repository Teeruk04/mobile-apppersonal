// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import, implementation_imports, override_on_non_overriding_member, annotate_overrides, unused_local_variable, unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:apppersonel/convert/activity.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:apppersonel/constants/api.dart';

class Activity extends StatefulWidget {
  final String id;
  Activity({required this.id});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<GetActivity> _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();
  @override
  void initState() {
    getActivity();
    super.initState();
  }

  String formatDateThai(DateTime dateTime) {
    // ตั้งค่าเลขฐาน 10 สำหรับ format วันที่
    initializeDateFormatting('th', null);

    // แปลง format วันที่ให้เป็นภาษาไทย
    return DateFormat('d MMMM yyyy', 'th_TH').format(dateTime);
  }

  Future<void> getActivity() async {
    final test = await database();
    setState(() {
      _data = test;
    });
  }

  Future<List<GetActivity>> database() async {
    var url = "${Url}Activity/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));

    return getActivityFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.blue,
        title: const Text(
          'กิจกรรมพิเศษ',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'K2D',
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'ค้นหา ปี-เดือน-วัน สถานที่  ปี',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: search,
            ),
          ),
          getBody(),
        ],
      ),
    );
  }

  Widget getBody() {
    return Expanded(
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, index) {
          final data = _data[index];
          return 
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'วันที่เริ่ม',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.grey,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${formatDateThai(data.activiStartdate)}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "วันสุดท้าย",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${formatDateThai(data.activiEnddate)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "สถานที่",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${data.activiPlacename}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "หน้าที่",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${data.activiPosition}",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'K2D',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          );
          ;
        },
      ),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final startdate = data.activiStartdate.year.toString().toLowerCase();
      final startdatem = data.activiStartdate.toString().toLowerCase();
      final activiPlacename = data.activiPlacename.toLowerCase();
      final input = query.toLowerCase();

      return startdate.contains(input) || activiPlacename.contains(input) ||startdatem.contains(input) ;
    }).toList();

    setState(() => _data = suggestions);
  }
}

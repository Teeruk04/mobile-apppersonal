// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, unused_local_variable

import 'package:apppersonel/constants/api.dart';
import 'package:apppersonel/screens/ReportLeaveDetail.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../convert/reportLeave.dart';

class ReportLeaveScreen extends StatefulWidget {
  final String id;
  ReportLeaveScreen({required this.id});

  @override
  State<ReportLeaveScreen> createState() => _ReportLeaveScreenState();
}

class _ReportLeaveScreenState extends State<ReportLeaveScreen> {
  List<ReportLeave> _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getReportLeaveByUserId();
    super.initState();
  }

  Future getReportLeaveByUserId() async {
    final datetrue = await database();
    setState(() {
      _data = datetrue;
    });
  }

  Future<List<ReportLeave>> database() async {
    var url = "${Url}ReponseLeave/FindByUserId/${widget.id}";
    var response = await http.get(Uri.parse(url));
    return reportLeaveFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.blue,
        title: const Text(
          "ประวัติการลาเเต่ละปี",
          style: TextStyle(fontFamily: 'K2D', color: Colors.black),
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
                hintText: 'ค้นหา ปี',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: search,
            ),
          ),
          getReportLeave(),
        ],
      ),
    );
  }

  Widget getReportLeave() {
    return Expanded(
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
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
                        title: Column(
                          children: [
                            Text(
                              "การลาปี ${_data[index].createdate.year}",
                              style: TextStyle(
                                fontFamily: 'K2D',
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'วันลาพักผ่อนคงเหลือจากปีที่ผ่านมา',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          Text(
                                            '${_data[index].reportLLastyear} วัน',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'วันลาพักร้อนประจำปีนี้',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          Text(
                                            '${_data[index].reportLThisyear} วัน',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                        const  Text(
                                            'รวมวันลาพักผ่อนประจำปีนี้',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          Text(
                                            '${_data[index].reportLLeave} วัน',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReportLeaveDetail(
                                                id: "${_data[index].id}",
                                              ),
                                              // ChildScreen(id: "${_token?.data.id}"),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'รายละเอียด',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontFamily: 'K2D',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final year = data.createdate.year.toString().toLowerCase();

      final input = query.toLowerCase();

      return year.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

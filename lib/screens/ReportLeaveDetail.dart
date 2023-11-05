// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field

import 'package:apppersonel/constants/api.dart';
import 'package:apppersonel/screens/leaveScreen.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import '../convert/leave.dart';
import '../convert/reportLeaveDetail.dart';

class ReportLeaveDetail extends StatefulWidget {
  final String id;
  ReportLeaveDetail({required this.id});

  @override
  State<ReportLeaveDetail> createState() => _ReportLeaveDetailState();
}

class _ReportLeaveDetailState extends State<ReportLeaveDetail> {
  ReportLeaveById? _reportLeave;
  Leave? _leave;
  final Url = API.BASE_URL;

  @override
  void initState() {
    getReportLeaveByUserId();
    getLeaveByUserId();
    super.initState();
  }

  Future getReportLeaveByUserId() async {
    var url = "${Url}ReponseLeave/GetReportLeaveById?id=${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _reportLeave = reportLeaveByIdFromJson(response.body);
    });
  }

  Future getLeaveByUserId() async {
    var url = "${Url}Leave/FindByReportId/${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _leave = leaveFromJson(response.body);
    });
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
          "สถิติวันลา",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "K2D",
          ),
        ),
      ),
      body: getReportLeave(),
    );
  }

  Widget getReportLeave() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blue[100],
                child: ListTile(
                  title: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Column(children: [
                         const Text(
                            'สถิติการลา',
                            style: TextStyle(
                                fontFamily: 'K2D',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        const  SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ประจำปี ${_reportLeave?.createdate.year}",
                            style: TextStyle(
                              fontFamily: 'K2D',
                              fontSize: 17,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
             const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.blue[100],
                child: Card(
                  child: DataTable(columns: [
                    DataColumn(
                        label: const Text(
                      'ประเภทการลา',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )),
                    DataColumn(
                        label: const Text(
                      'ลาเเล้ว',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )),
                    DataColumn(
                        label: const Text(
                      'เหลืออีก',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(const Text(
                        'ลาพักผ่อน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                      DataCell(
                          Text('${_leave == null ? "" : _leave?.leaveCount}')),
                      DataCell(Text(
                          '${_reportLeave?.reportLLeave == null ? "" : _reportLeave!.reportLLeave - _leave!.leaveCount}')),
                    ]),
                    DataRow(cells: [
                      DataCell(const Text(
                        'ลาป่วย',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                      DataCell(Text(
                          '${_leave == null ? "" : _leave?.leavesickCount}')),
                      DataCell(Text(
                          '${_reportLeave?.reportLLeavesick == null ? "" : _reportLeave!.reportLLeavesick - _leave!.leavesickCount}')),
                    ]),
                    DataRow(cells: [
                      DataCell(const Text(
                        'ลาคลอด',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                      DataCell(Text(
                          '${_leave == null ? "" : _leave?.leavematerntityCount}')),
                      DataCell(Text(
                          '${_reportLeave?.reportLLeavematerntity == null ? "" : _reportLeave!.reportLLeavematerntity - _leave!.leavematerntityCount}')),
                    ]),
                    DataRow(cells: [
                      DataCell(const Text(
                        'ลาช่วยเหลือภริยา',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                      DataCell(Text(
                          '${_leave == null ? "" : _leave?.leaveThhwwgbCount}')),
                      DataCell(Text(
                          '${_reportLeave?.reportLLeaveThhwwgb == null ? "" : _reportLeave!.reportLLeaveThhwwgb - _leave!.leaveThhwwgbCount}')),
                    ]),
                    DataRow(cells: [
                      DataCell(const Text(
                        'ลาอุปสมบท',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                      DataCell(Text(
                          '${_leave == null ? "" : _leave?.leaveordinationCount}')),
                      DataCell(Text(
                          '${_reportLeave?.reportLLeaveordination == null ? "" : _reportLeave!.reportLLeaveordination - _leave!.leaveordinationCount}')),
                    ]),
                    DataRow(cells: [
                      DataCell(const Text(
                        'ลาไปถือศีล',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                      DataCell(Text(
                          '${_leave == null ? "" : _leave?.leaveforfastingCount}')),
                      DataCell(Text(
                          '${_reportLeave?.reportLLeaveforfasting == null ? "" : _reportLeave!.reportLLeaveforfasting - _leave!.leaveforfastingCount}')),
                    ]),
                  ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LeaveScreen(
                        id: "${_reportLeave?.id}",
                      ),
                      // ChildScreen(id: "${_token?.data.id}"),
                    ),
                  );
                },
                child: const Text("ประวัติการลา"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

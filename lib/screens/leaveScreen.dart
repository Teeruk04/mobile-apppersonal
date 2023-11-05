// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/constants/api.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../convert/leave.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:apppersonel/constants/enum.dart';

class LeaveScreen extends StatefulWidget {
  final String id;
  LeaveScreen({required this.id});
  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  Leave? _data;
  final Url = API.BASE_URL;

  @override
  void initState() {
    getLeaveAll();
    super.initState();
  }

  Future<void> getLeaveAll() async {
    var url = "${Url}Leave/FindByReportId/${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _data = leaveFromJson(response.body);
    });
  }

  String DateTH(DateTime dateTime) {
    initializeDateFormatting('th_TH', null);
    return DateFormat('d MMMM yyyy', 'th_TH').format(dateTime);
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
          'ประวัติการลา',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'K2D',
          ),
        ),
      ),
      body: getLeave(),
    );
  }

  Widget getLeave() {
    return ListView.builder(
      itemCount: _data?.leaves.length,
      itemBuilder: (context, index) {
        return Column(
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
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    title: Center(
                      child: Text(
                        "${LeaveType[_data?.leaves[index].leaveType]}",
                        style: TextStyle(
                          fontFamily: 'K2D',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  'ตั้งเเต่วันที่',
                                  style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data == null ? "" : DateTH(_data!.leaves[index].leaveStartdate)}',
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'ถึง',
                                  style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data == null ? "" : DateTH(_data!.leaves[index].leaveEnddate)}',
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  'จำนวน',
                                  style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data?.leaves[index].leaveQuantity}',
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'วัน',
                                  style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "หมายเหตุ",
                                  style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${_data?.leaves[index].leaveNote}",
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

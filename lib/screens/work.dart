// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:apppersonel/constants/api.dart';
import '../convert/work.dart';

class WorkScreen extends StatefulWidget {
  final String id;
  WorkScreen({required this.id});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  List<Work>? _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getWork();
    super.initState();
  }

  Future<void> getWork() async {
    final test = await database();
    setState(() {
      _data = test;
    });
  }

  Future<List<Work>> database() async {
    var url = "${Url}WorkHistory/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    return workFromJson(response.body);
  }

  String DateTH(DateTime dateTime) {
    initializeDateFormatting('th', null);
    return DateFormat('d MMMM yyyy', 'th').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.grey[100],
        title: const Text(
          'ประวัติการทำงาน',
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
                hintText: 'ค้นหา ปี ตำเเหน่ง บริษัทหรือนายจ้าง',
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
          itemCount: _data?.length,
          itemBuilder: (BuildContext context, index) {
            final data = _data?[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        backgroundColor: Colors.white,
                        title: Text(
                          'ตำเเหน่ง  ${data!.workHPosition}',
                          style: TextStyle(
                            fontFamily: 'K2D',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'วันเเรกที่ทำงาน',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'K2D',
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${DateTH(data.workHStartdate)}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'วันที่ลาออก',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'K2D',
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${DateTH(data.workHEnddate)}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'K2D',
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'นายจ้างหรือบริษัท',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'K2D',
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${data.workHEmployer}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontFamily: 'K2D',
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'สถานที่ตั้ง',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'K2D',
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${data.workHPlacename}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'K2D',
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'เหตุผลที่ย้าย',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'K2D',
                                    color: Colors.grey,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${data.workHReason}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          }),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final startdate = data.workHStartdate.year.toString().toLowerCase();
      final enddate = data.workHEnddate.year.toString().toLowerCase();
      final position = data.workHPosition.toLowerCase();
      final employer = data.workHEmployer.toLowerCase();
      final input = query.toLowerCase();

      return startdate.contains(input) ||
          enddate.contains(input) ||
          position.contains(input) ||
          employer.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

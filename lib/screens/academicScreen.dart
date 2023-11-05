// ignore_for_file: prefer_const_constructors, unused_field, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:apppersonel/screens/academicDetail.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../convert/academic.dart';
import 'package:apppersonel/constants/api.dart';

class AcademicScreen extends StatefulWidget {
  final String id;
  AcademicScreen({required this.id});
  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  List<Academic>? _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getAcademic();
    super.initState();
  }

  Future getAcademic() async {
    final datatrue = await database();
    setState(() {
      _data = datatrue;
    });
  }

  Future<List<Academic>> database() async {
    var url = "${Url}Academic/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    return academicFromJson(response.body);
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
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.blue,
        title: const Text(
          'ประวัติตำเเหน่งทางวิชาการ',
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
          itemCount: _data?.length,
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
                      child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          'ตำเเหน่ง',
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
                                          '${_data?[index].academicPosition}',
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
                                          'สาขา',
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
                                          '${_data?[index].academicBranchname}',
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
                                          'วันที่ดำรงตำเเหน่ง',
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
                                          '${DateTH(_data![index].academicStartdate)}',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontFamily: 'K2D',
                                          ),
                                        )
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
                                                DetailAcademic(
                                              id: "${_data?[index].id}",
                                            ),
                                            // ChildScreen(id: "${_token?.data.id}"),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'รายละเอียด',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                          fontFamily: 'K2D',
                                        ),
                                      ),
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
          }),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final startdate = data.academicStartdate.toString().toLowerCase();
      final position = data.academicPosition.toLowerCase();
      final branch = data.academicBranchname.toLowerCase();
      final input = query.toLowerCase();

      return startdate.contains(input) ||
          position.contains(input) ||
          branch.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

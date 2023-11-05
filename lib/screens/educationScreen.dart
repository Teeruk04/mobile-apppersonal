// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/screens/educationDetail.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:apppersonel/constants/api.dart';

import '../convert/education.dart';

class EducationScreen extends StatefulWidget {
  final String id;
  EducationScreen({required this.id});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  List<Education>? _data = [];
  final Url = API.BASE_URL;
  final UrlImage = API.BASE_IMAGE;
  final controller = TextEditingController();

  @override
  void initState() {
    getEducation();
    super.initState();
  }

  Future<void> getEducation() async {
    final test = await database();
    setState(() {
      _data = test;
    });
  }

  Future<List<Education>> database() async {
    var url = "${Url}Education/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));

    return educationFromJson(response.body);
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
          'ประวัติการศึกษา',
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
                hintText: 'ค้นหา ปี-เดือน-วัน หลักสูตร',
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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shadowColor: Colors.black,
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${UrlImage}${_data?[index].file}"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            'ระดับการศึกษา',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${_data?[index].level.levelName}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'K2D',
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            'หลักสูตร',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${_data?[index].educaCourse}',
                                            style: TextStyle(
                                              fontSize: 13,
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
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            'วันที่เริ่มศึกษา',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${DateTH(_data![index].educaStartdate)}',
                                            style: TextStyle(
                                              fontSize: 13,
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
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            'วันที่เรียนจบ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontFamily: 'K2D',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${DateTH(_data![index].educaEnddate)}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontFamily: 'K2D',
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EducationDetail(
                                                id: "${_data?[index].id}",
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
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final course = data.educaCourse.toLowerCase();
      final startdate = data.educaStartdate.year.toString().toLowerCase();
      final enddate = data.educaEnddate.year.toString().toLowerCase();

      final input = query.toLowerCase();
      return course.contains(input) ||
          startdate.contains(input) ||
          enddate.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

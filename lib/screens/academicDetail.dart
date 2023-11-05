// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:apppersonel/constants/api.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../convert/academicDetail.dart';

class DetailAcademic extends StatefulWidget {
  final String id;
  DetailAcademic({required this.id});

  @override
  State<DetailAcademic> createState() => _DetailAcademicState();
}

class _DetailAcademicState extends State<DetailAcademic> {
  AcademicDetail? _data;
  final Url = API.BASE_URL;
  final UrlImage = API.BASE_IMAGE;
  @override
  void initState() {
    getDetail();
    super.initState();
  }

  Future getDetail() async {
    var url = "${Url}Academic/GetAcademicId?id=${widget.id}";

    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _data = academicDetailFromJson(response.body);
    });
  }

  String DateTH(DateTime? dateTime) {
    initializeDateFormatting('th', null);
    return DateFormat('d MMMM yyyy', 'th').format(dateTime!);
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
          "รายละเอียดตำเเหน่งทางวิชาการ",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'K2D',
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${UrlImage}${_data?.file}"),
                ),
              ),
            ),
          ),
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
                    const Text(
                      'ตำเเหน่งทางวิชาการ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'K2D',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'ตำเเหน่ง',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${_data?.academicPosition}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'รหัสสาขา',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${_data?.academicBranchcode}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'สาขา',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${_data?.academicBranchname}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'ดำรงตำเเหน่งเมื่อ',
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
                                '${_data == null ? "" : DateTH(_data?.academicStartdate)}',
                                style:
                                    TextStyle(fontFamily: 'K2D', fontSize: 17),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'อ้างอิง',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.grey,
                              fontFamily: 'K2D',
                            ),
                          ),
                          Text(
                            '${_data?.academicRefer}',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'K2D',
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

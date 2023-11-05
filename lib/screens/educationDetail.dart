// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/convert/educationDetail.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:apppersonel/constants/api.dart';

class EducationDetail extends StatefulWidget {
  final String id;
  EducationDetail({required this.id});
  @override
  State<EducationDetail> createState() => _EducationDetailState();
}

class _EducationDetailState extends State<EducationDetail> {
  DetailEducation? _data;
  final Url = API.BASE_URL;
  final UrlImage = API.BASE_IMAGE;
  @override
  void initState() {
    getDetail();
    super.initState();
  }

  String DateTH(DateTime dateTime) {
    initializeDateFormatting('th', null);
    return DateFormat('d MMMM yyyy', 'th').format(dateTime);
  }

  Future getDetail() async {
    var url = "${Url}Education/GetEducationById?id=${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _data = detailEducationFromJson(response.body);
    });
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
            'รายละเอียดการศึกษา',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'K2D',
            ),
          ),
        ),
        body: getBody());
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
                    title: Column(
                      children: [
                        const Text(
                          'การศึกษา',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.grey,
                            fontFamily: 'K2D',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  'วันที่เริ่มศึกษา',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_data == null ? "" : DateTH(_data!.educaStartdate)}',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                  'วันที่จบ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_data == null ? "" : DateTH(_data!.educaEnddate)}',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                  'สถานศึกษา',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_data?.educaPlacename}',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                  'หลักสูตร',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_data?.educaCourse}',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                  'ระดับการศึกษา',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_data?.level.levelName}',
                                  style: TextStyle(
                                    fontSize: 15,
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
                                  'ผลการศึกษา',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_data?.educaResults}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'K2D',
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'ที่ตั้งสถานศึกษา',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey,
                                fontFamily: 'K2D',
                              ),
                            ),
                            Text(
                              '${_data?.educaLocation}',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'K2D',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

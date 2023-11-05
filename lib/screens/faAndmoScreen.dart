// ignore_for_file: prefer_const_constructors, unused_field

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lottie/lottie.dart';
import '../convert/faAndmo.dart';
import 'package:apppersonel/constants/api.dart';

class FaAndMoScreen extends StatefulWidget {
  final String id;
  FaAndMoScreen({required this.id});
  @override
  State<FaAndMoScreen> createState() => _FaAndMoScreenState();
}

class _FaAndMoScreenState extends State<FaAndMoScreen> {
  List<FatherAndMother>? _data = [];
  final Url = API.BASE_URL;
  @override
  void initState() {
    getFaAndMo();
    super.initState();
  }

  Future getFaAndMo() async {
    var url = "${Url}FaAndMo/FindByUserId${widget.id}";
    var respones = await http.get(Uri.parse(url));
    print(respones.body);

    setState(() {
      _data = fatherAndMotherFromJson(respones.body);
    });
  }

  String formatDateThai(DateTime dateTime) {
    // ตั้งค่าเลขฐาน 10 สำหรับ format วันที่
    initializeDateFormatting('th', null);

    // แปลง format วันที่ให้เป็นภาษาไทย
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
          'ประวัติของบิดาเเละมารดา',
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
    return ListView.builder(
        itemCount: _data?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              Text(
                                '${_data?[0].title.titleName} ${_data?[0].faName} ${_data?[0].faLastname}',
                                style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "วันเกิด ${formatDateThai(_data![0].faBirthdate)}",
                                style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "บิดา",
                                style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 15,
                                    color: Colors.grey[600]),
                              )
                            ]),
                          ),
                        ],
                      )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "เชื้อชาติ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${_data?[0].faRace}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "สัญชาติ",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${_data?[0].faNationality}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "ศาสนา",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${_data?[0].faReligion}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'สถานที่เกิด',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].faPlacebirth}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'เบอร์โทรศัพท์มือถือ',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].faPhone}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "อาชีพ",
                                    style: TextStyle(
                                        fontFamily: 'K2D',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${_data?[0].faOccupation}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'ตำเเหน่ง',
                                    style: TextStyle(
                                        fontFamily: 'K2D',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '${_data?[0].faPosition}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'สถานที่ทำงาน',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].faWorkplace}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'เบอร์โทรศัพท์ของสถานที่ทำงาน',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].faWPphone}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'ที่อยู่ปัจจุบัน',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${_data?[0].faAddress}',
                                style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              Text(
                                '${_data?[0].titleM.title} ${_data?[0].moName} ${_data?[0].moLastname}',
                                style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "วันเกิด ${formatDateThai(_data![0].moBirthdate)}",
                                style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "มารดา",
                                style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 15,
                                    color: Colors.grey[600]),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "เชื้อชาติ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${_data?[0].moRace}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "สัญชาติ",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${_data?[0].moNationality}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "ศาสนา",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${_data?[0].moReligion}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'สถานที่เกิด',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].moPlacebirth}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      color: Colors.black,
                                      fontSize: 15,
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
                                    'เบอร์โทรศัพท์มือถือ',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].moPhone}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
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
                                    "อาชีพ",
                                    style: TextStyle(
                                        fontFamily: 'K2D',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${_data?[0].moOccupation}",
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
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
                                    'ตำเเหน่ง',
                                    style: TextStyle(
                                        fontFamily: 'K2D',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '${_data?[0].moPosition}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
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
                                    'สถานที่ทำงาน',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].moWorkplace}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
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
                                    'เบอร์โทรศัพท์ของสถานที่ทำงาน',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${_data?[0].moWPphone}',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.black,
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
                                    'ที่อยู่ปัจจุบัน',
                                    style: TextStyle(
                                      fontFamily: 'K2D',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${_data?[0].moAddress}',
                                style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          );
        });
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../convert/address.dart';
import 'package:apppersonel/constants/api.dart';

class AddressScreen extends StatefulWidget {
  final String id;
  AddressScreen({required this.id});
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Address>? _data = [];
  final Url = API.BASE_URL;
  @override
  void initState() {
    getAddress();
    super.initState();
  }

  Future getAddress() async {
    var url = "${Url}Address/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _data = addressFromJson(response.body);
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
        foregroundColor: Colors.blue,
        backgroundColor: Colors.grey[100],
        title: const Text(
          'ประวัติที่อยู่อาศัย',
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
      itemBuilder: (BuildContext context, index) {
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
                    title: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'วันเเรก',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                Text(
                                  '${formatDateThai(_data![index].addressStartdate)}',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'วันสุดท้าย',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                Text(
                                  '${formatDateThai(_data![index].addressEnddate)}',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'เลขที่',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data?[index].addressHousenumber}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'ซอย',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data?[index].addressAlley == null ? "ไม่ระบุ" : _data?[index].addressAlley}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'ถนน',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data?[index].addressRoad == null ? "ไม่ระบุ" : _data?[index].addressRoad}',
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'ตำบล',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data?[index].addressCanton}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'อำเภอ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_data?[index].addressDistrict}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'จังหวัด',
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
                                  '${_data?[index].addressProvince}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'ประเทศ',
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
                                  '${_data?[index].addressCountry}',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'สถานะ',
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
                                  '${_data?[index].statusA.name}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                )
                              ],
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
        );
      },
    );
  }
}

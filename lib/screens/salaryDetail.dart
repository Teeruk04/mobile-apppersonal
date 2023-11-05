// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/convert/salaryDetail.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:lottie/lottie.dart';
import 'package:apppersonel/constants/api.dart';
import 'package:intl/intl.dart';

class SalaryDetail extends StatefulWidget {
  final String id;
  SalaryDetail({required this.id});
  @override
  State<SalaryDetail> createState() => _SalaryDetailState();
}

class _SalaryDetailState extends State<SalaryDetail> {
  DetailSalary? _data;
  final Url = API.BASE_URL;
  @override
  void initState() {
    getDetail();
    super.initState();
  }

  Future getDetail() async {
    var url = "${Url}Salary/GetSalaryById?id=${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    setState(() {
      _data = detailSalaryFromJson(response.body);
    });
  }

  String DateTH(DateTime? dateTime) {
    initializeDateFormatting('th', null);
    return DateFormat('d MMMM yyyy', 'th').format(dateTime!);
  }

  String Monney(double? monney) {
    return NumberFormat.currency(locale: 'en_US', symbol: '').format(monney);
  }

  String MonneyI(int? monney) {
    return NumberFormat.currency(locale: 'en_US', symbol: '').format(monney);
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
          'รายละเอียดเงินเดือน',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    tileColor: Colors.white,
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'ประเภท',
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
                                '${_data?.types?.name}',
                                style: TextStyle(
                                  fontSize: 15,
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

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'เลขที่คำสั่ง',
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
                                '${_data?.salaryOrdernum}',
                                style: TextStyle(
                                  fontSize: 15,
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

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'วันที่คำสั่ง',
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
                                '${_data == null ? "" : DateTH(_data?.salaryDatenum)}',
                                style: TextStyle(
                                  fontSize: 15,
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

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'วันที่มีผล',
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
                                '${_data == null ? "" : DateTH(_data?.salaryEffectivedate)}',
                                style: TextStyle(
                                  fontSize: 15,
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

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'วันที่สิ้นสุด',
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
                                '${_data == null ? "" : DateTH(_data?.salaryEnddate)}',
                                style: TextStyle(
                                  fontSize: 15,
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

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'เงินเดือน',
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
                                '${_data == null ? "" : Monney(_data?.salarySalary)} บาท',
                                style: TextStyle(
                                  fontSize: 15,
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

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'เงินเดือนก่อนเลื่อน',
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
                                '${_data == null ? "" : MonneyI(_data!.salaryBeforepostpone)} บาท',
                                style: TextStyle(
                                  fontSize: 15,
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
                                'ร้อยละ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              Text(
                                '${_data?.salaryPercentage}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'K2D',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'ฐานคำนวณ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              Text(
                                '${_data == null ? "" : MonneyI(_data?.salaryCalculationbase)} บาท',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'K2D',
                                ),
                              ),
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
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${_data?.status?.name}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'K2D',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Center(
            child: Lottie.network(
                "https://assets7.lottiefiles.com/packages/lf20_OdVhgq.json"),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, unused_field

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../convert/manage.dart';
import 'package:apppersonel/constants/api.dart';

class ManageScreen extends StatefulWidget {
  final String id;
  ManageScreen({required this.id});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  List<Manage>? _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();
  @override
  void initState() {
    getManage();
    super.initState();
  }

  Future getManage() async {
    final datatrue = await database();
    setState(() {
      _data = datatrue;
    });
  }

  Future<List<Manage>> database() async {
    var url = "${Url}ManageP/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    return manageFromJson(response.body);
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
          'ประวัติตำเเหน่งบริหาร',
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
                hintText: 'ค้นหา ปี-เดือน-วัน ตำเเหน่ง หน่วยงาน',
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
          final data = _data?[index];
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
                      title: Text(
                        'ตำเเหน่ง ${data!.managePPosition}',
                        style: TextStyle(
                            fontFamily: 'K2D',
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'หน่วยงาน',
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
                                    '${data.managePAgency}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'K2D',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        'วันเเรก',
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
                                        '${DateTH(data.managePStartdate)}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'K2D',
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        'วันสุดท้าย',
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
                                        '${_data?[index].managePEnddate == null ? "ยังไม่ระบุ" : DateTH(data.managePEnddate)}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'K2D',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'รายละเอียด',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontFamily: 'K2D',
                                ),
                              ),
                              Text(
                                '${data.managePDetails}',
                                style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontSize: 17,
                                ),
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
                                '${data.managePRefer}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'K2D',
                                ),
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
                                    "${data.status.name}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'K2D',
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              )
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
      ),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final startdate = data.managePStartdate.toString().toLowerCase();
      final enddate = data.managePEnddate.toString().toLowerCase();
      final position = data.managePPosition.toLowerCase();
      final agency = data.managePAgency.toLowerCase();

      final input = query.toLowerCase();

      return startdate.contains(input) ||
          enddate.contains(input) ||
          position.contains(input) ||
          agency.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

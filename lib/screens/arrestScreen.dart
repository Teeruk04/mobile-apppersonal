// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:apppersonel/constants/api.dart';

import '../convert/arrest.dart';

class ArrestScreen extends StatefulWidget {
  final String id;
  ArrestScreen({required this.id});
  @override
  State<ArrestScreen> createState() => _ArrestScreenState();
}

class _ArrestScreenState extends State<ArrestScreen> {
  List<Arrest>? _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getArrest();
    super.initState();
  }

  Future<void> getArrest() async {
    final datatrue = await database();
    setState(() {
      _data = datatrue;
    });
  }

  Future<List<Arrest>> database() async {
    var url = "${Url}Arrest/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));

    return arrestFromJson(response.body);
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
          'ประวัติการฟ้องศาล',
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
                hintText: 'ค้นหา ปี-เดือน-วัน ข้อหา สถานที่เกิดเหตุ',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'วันที่เกิดเหตุ',
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
                                      '${DateTH(data!.arrestDate)}',
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
                                      'ข้อหา',
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
                                      '${data.arrestPlaint}',
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
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'สถานที่เกิดเหตุ',
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
                                  ],
                                ),
                                Text(
                                  '${data.arrestCrimescene}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'ผลสุดท้ายของคดี',
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
                                  ],
                                ),
                                Text(
                                  '${data.arrestOutcomeofthecase}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            );
          }),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final date = data.arrestDate.toString().toLowerCase();
      final plaint = data.arrestPlaint.toString().toLowerCase();
      final input = query.toLowerCase();

      return date.contains(input) || plaint.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

// ignore_for_file: prefer_const_constructors, unused_field

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../convert/insignia.dart';
import 'package:apppersonel/constants/api.dart';

class InsigniaScreen extends StatefulWidget {
  final String id;
  InsigniaScreen({required this.id});
  @override
  State<InsigniaScreen> createState() => _InsigniaScreenState();
}

class _InsigniaScreenState extends State<InsigniaScreen> {
  List<Ingisnia>? _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getInsignia();
    super.initState();
  }

  Future getInsignia() async {
    final datatrue = await database();
    setState(() {
      _data = datatrue;
    });
  }

  Future<List<Ingisnia>> database() async {
    var url = "${Url}Insignia/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    return ingisniaFromJson(response.body);
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
          'ประวัติเครื่องราชอิสริยาภรณ์',
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
                hintText: 'ค้นหา ปี-เดือน-วัน ปี เครื่องราชฯ',
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
                      child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'เครื่องราชอิสริยาภรณ์',
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
                                      '${data!.insigniaName}',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'K2D',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          'ปี พ.ศ.',
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
                                          '${data.insigniaYear}',
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
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          'วันที่ได้รับ',
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
                                          '${DateTH(data.insigniaReceiveddate)}',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'K2D',
                                          ),
                                        )
                                      ],
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
      final receiveddate = data.insigniaReceiveddate.toString().toLowerCase();
      final year = data.insigniaYear.toLowerCase();
      final name = data.insigniaName.toLowerCase();
      final input = query.toLowerCase();

      return receiveddate.contains(input) ||
          year.contains(input) ||
          name.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

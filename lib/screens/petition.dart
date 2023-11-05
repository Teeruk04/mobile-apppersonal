// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/constants/api.dart';
import 'package:apppersonel/convert/Petition.dart';
import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Petition extends StatefulWidget {
  final String id;
  Petition({required this.id});

  @override
  State<Petition> createState() => _PetitionState();
}

class _PetitionState extends State<Petition> {
  List<PetitionAll>? _data;
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getPetitionByUserId();
    super.initState();
  }

  Future<void> getPetitionByUserId() async {
    final datatrue = await database();
    setState(() {
      _data = datatrue;
    });
  }

  Future<List<PetitionAll>> database() async {
    var url = "${Url}Petition/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    return petitionAllFromJson(response.body);
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
          'ประวัติการยื่นคำร้อง',
          style: TextStyle(
            color: Colors.blue,
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
                hintText: 'ค้นหา ปี-เดือน-วัน รายละเอียด',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: search,
            ),
          ),
          getPetition(),
        ],
      ),
    );
  }

  Widget getPetition() {
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
                             const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'วันที่ยื่นคำร้อง ${_data == null ? "" : DateTH(data!.createdate)}',
                                style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'รายละเอียด',
                                      style: TextStyle(
                                        fontFamily: 'K2D',
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${_data == null ? "" : data!.petiMessage}',
                                      style: TextStyle(
                                          fontFamily: 'K2D',
                                          fontSize: 17,
                                          color: Colors.black),
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
                                          'สถานะ',
                                          style: TextStyle(
                                              fontFamily: 'K2D',
                                              fontSize: 17,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${_data == null ? "" : data!.petiStaus}',
                                          style: TextStyle(
                                            fontFamily: 'K2D',
                                            fontSize: 17,
                                          ),
                                        ),
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
      final date = data.createdate.toString().toLowerCase();
      final message = data.petiMessage.toLowerCase();
      final status = data.petiStaus.toLowerCase();

      final input = query.toLowerCase();

      return date.contains(input) ||
          message.contains(input) ||
          status.contains(input);
    }).toList();

    setState(() => _data = suggestions);
  }
}

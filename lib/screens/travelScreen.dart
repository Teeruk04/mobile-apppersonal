// ignore_for_file: prefer_const_constructors

import 'package:apppersonel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../convert/travel.dart';
import 'package:apppersonel/constants/api.dart';

class TravelScreen extends StatefulWidget {
  final String id;
  TravelScreen({required this.id});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  List<Travel>? _data = [];
  final Url = API.BASE_URL;
  final controller = TextEditingController();

  @override
  void initState() {
    getTravel();
    super.initState();
  }

  Future getTravel() async {
    final datatrue = await database();
    setState(() {
      _data = datatrue;
    });
  }

  Future<List<Travel>> database() async {
    var url = "${Url}Travel/FindByUserId${widget.id}";
    var response = await http.get(Uri.parse(url));
    return travelFromJson(response.body);
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
          'ประวัติการไปต่างประเทศ',
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
                hintText: 'ค้นหา ปี-เดือน-วัน ประเทศ เมือง',
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
                        title: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'ประเทศ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontFamily: 'K2D',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${data!.travelCounty}',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'K2D',
                              ),
                            )
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                   const Text(
                                      'เมือง',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.grey,
                                        fontFamily: 'K2D',
                                      ),
                                    ),
                                    Text(
                                      '${data.travelCity}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'K2D',
                                      ),
                                    ),
                                  ],
                                ),
                              const  SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'วันที่ไป',
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
                                      '${DateTH(data.travelStartdate)}',
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
                                      'วันที่กลับ',
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
                                      '${DateTH(data.travelEnddate)}',
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
                                const Text(
                                  'ความมุ่งหมาย',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                              const  SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${data.travelPurpose}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'ทุนที่ได้รับ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                    fontFamily: 'K2D',
                                  ),
                                ),
                                Text(
                                  '${data.travelCapital}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: 'K2D',
                                  ),
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
          }),
    );
  }

  void search(String query) async {
    final dataBase = await database();
    final suggestions = dataBase.where((data) {
      final startdate = data.travelStartdate.toString().toLowerCase();
      final enddate = data.travelEnddate.toString().toLowerCase();
      final county = data.travelCounty.toString().toLowerCase();
      final city = data.travelCity.toLowerCase();
      final input = query.toLowerCase();

      return startdate.contains(input) ||
          enddate.contains(input) ||
          county.contains(input) ||
          city.contains(input);
      ;
    }).toList();

    setState(() => _data = suggestions);
  }
}

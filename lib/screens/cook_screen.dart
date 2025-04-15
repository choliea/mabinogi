import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class CookScreen extends StatefulWidget {
  @override
  _CookScreenState createState() => _CookScreenState();
}

class _CookScreenState extends State<CookScreen> {
  List<List<dynamic>> _cookData = [];

  @override
  void initState() {
    super.initState();
    _loadCookData();
  }

  Future<void> _loadCookData() async {
    final rawData = await rootBundle.loadString('database/cook.csv');
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _cookData = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _cookData.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _cookData.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ListTile(
                  title: Text(_cookData[index][0].toString()), // 음식명
                  subtitle: Text(_cookData[index][6].toString()), // 재료
                );
              } else {
                return ListTile(
                  title: Text(_cookData[index][0].toString()), // 음식명
                  subtitle: Text(_cookData[index][6].toString()), // 재료
                );
              }
            },
          );
  }
}

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../data_model.dart';

class BuyScreen extends StatefulWidget {
  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  List<BuyItem> buyItems = [];

  @override
  void initState() {
    super.initState();
    loadBuyItems();
  }

  Future<void> loadBuyItems() async {
    final csvData = await rootBundle.loadString('database/tobuy.csv');
    final List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);

    List<BuyItem> items = [];
    for (int i = 1; i < csvTable.length; i++) {
      final row = csvTable[i];
      try {
        items.add(BuyItem(
          name: row[0].toString(),
          count: int.tryParse(row[1].toString()) ?? 0,
          npc: row[2].toString(),
          type: row[3].toString(),
          exchangeMaterial: row[4].toString(),
          exchangeMaterialCount: int.tryParse(row[5].toString()) ?? 0,
          sellCount: int.tryParse(row[6].toString()) ?? 0,
          resetCycle: row[7].toString(),
          accountLimit: row[8].toString(),
          buyCharacter1: row[9].toString() == 'Yes',
          buyCharacter2: row[10].toString() == 'Yes',
          buyCharacter3: row[11].toString() == 'Yes',
          buyHope: row[12].toString() == 'Yes',
          region: row[13].toString(),
        ));
      } catch (e) {
        print('Error parsing row in BuyScreen: $row');
        print('Error: $e');
      }
    }
    setState(() {
      buyItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Items'),
      ),
      body: ListView.builder(
        itemCount: buyItems.length,
        itemBuilder: (context, index) {
          final item = buyItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NPC: ${item.npc}, Region: ${item.region}, Type: ${item.type}'),
                if (item.exchangeMaterial.isNotEmpty)
                  Text('Exchange Material: ${item.exchangeMaterial} x${item.exchangeMaterialCount}'),
              ],
            ),
            trailing: Checkbox(
              value: item.wantToBuy,
              onChanged: (bool? value) {
                setState(() {
                  item.wantToBuy = value ?? false;
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total items to buy: ${buyItems.where((item) => item.wantToBuy).length}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Total materials needed: ${buyItems.where((item) => item.wantToBuy).fold(0, (sum, item) => sum + (item.wantToBuy ? item.exchangeMaterialCount : 0))}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

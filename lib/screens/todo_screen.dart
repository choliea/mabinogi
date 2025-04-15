import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../data_model.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> todoItems = [];

  @override
  void initState() {
    super.initState();
    loadTodoItems();
  }

  Future<void> loadTodoItems() async {
    final csvData = await rootBundle.loadString('database/todo.csv');
    final List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);

    List<TodoItem> items = [];
    for (int i = 1; i < csvTable.length; i++) {
      final row = csvTable[i];
      try {
        items.add(TodoItem(
          name: row[0].toString(),
          possibleCount: int.tryParse(row[1].toString()) ?? 0,
          character1: row[2].toString() == '1',
          character2: row[3].toString() == '1',
          character3: row[4].toString() == '1',
        ));
      } catch (e) {
        print('Error parsing row: $row');
        print('Error: $e');
      }
    }
    setState(() {
      todoItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoItems.length,
      itemBuilder: (context, index) {
        final item = todoItems[index];
        return ListTile(
          title: Text(item.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: item.character1,
                onChanged: (value) {
                  setState(() {
                    item.character1 = value ?? false;
                  });
                },
              ),
              Checkbox(
                value: item.character2,
                onChanged: (value) {
                  setState(() {
                    item.character2 = value ?? false;
                  });
                },
              ),
              Checkbox(
                value: item.character3,
                onChanged: (value) {
                  setState(() {
                    item.character3 = value ?? false;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

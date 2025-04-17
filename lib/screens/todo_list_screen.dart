import 'package:flutter/material.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:mabinogi/screens/to_buy_list_screen.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    final selectedCharacter = characterProvider.selectedCharacter;

    if (selectedCharacter == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: const Center(child: Text('No character selected.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ToBuyListScreen()),
            );
          }, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: ListView.builder(
        itemCount: selectedCharacter.todoList.length,
        itemBuilder: (context, index) {
          final todo = selectedCharacter.todoList[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.mission.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Progress: ${todo.completedCount}/${todo.mission.totalCount}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      characterProvider.updateTodo(selectedCharacter, todo);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      characterProvider.updateTodo(selectedCharacter, todo);
                    },
                  ),
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) {
                      characterProvider.updateTodo(selectedCharacter, todo);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
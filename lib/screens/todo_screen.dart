import 'package:flutter/material.dart';
import 'package:mabinogi/screens/main_screen.dart';

Widget todoSection(selectedCharacter) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AccountTodoList(),
        ),
      ),
      SizedBox(height: 16),

      ExpansionTile(
        title: Text('데일리 Todos'),
        backgroundColor: Colors.grey[200], //요거 색 변경
        children: [
          if (selectedCharacter != null)
            TodoList(
              todoList: selectedCharacter.dailyTodos,
              todoListType: 'daily',
              characterProfile: selectedCharacter,
            ),
        ],
      ),
      ExpansionTile(
        title: Text('주간 보스'),
        children: [
          if (selectedCharacter != null)
            TodoList(
              todoList: selectedCharacter.weeklyBoss,
              todoListType: 'weeklyBoss',
              characterProfile: selectedCharacter,
            ),
        ],
      ),
      ExpansionTile(
        title: Text('어비스 던전'),
        children: [
          if (selectedCharacter != null)
            AbisTodoList(
              abis: selectedCharacter.abis,
              characterProfile: selectedCharacter,
            ),
        ],
      ),
    ],
  );
}

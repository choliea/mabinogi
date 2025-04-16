import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_model.dart';

// 모델 클래스 (이전 답변에서 제공된 TodoItem, CharacterProfile 모델 사용)

class TodoProvider extends ChangeNotifier {
  List<TodoItem> _todoList = [];
  CharacterProfile? _selectedCharacter;

  TodoProvider(List<CharacterProfile> profiles) {
    _todoList = createInitialTodoList(profiles); // 초기 Todo 리스트 생성
  }

  List<TodoItem> get todoList => _todoList;
  CharacterProfile? get selectedCharacter => _selectedCharacter;

  void toggleTodo(TodoItem todo, CharacterProfile profile, bool value) {
    todo.setCharacterCompletion(profile, value);
    notifyListeners();
  }

  void incrementTodoCount(TodoItem todo) {
    todo.incrementCompletedCount();
    notifyListeners();
  }

  void decrementTodoCount(TodoItem todo) {
    if (todo.completedCount > 0) {
      todo.completedCount--;
      notifyListeners();
    }
  }

  // 캐시샵 아이템 구매 시 모든 캐릭터 완료 처리
  void setAllCharactersComplete(TodoItem todo, bool value) {
    if (todo.title == "캐시샵 무료 패션 아이템 구입") {
      for (var profile in todo.characterCompletion.keys) {
        todo.setCharacterCompletion(profile, value);
      }
      notifyListeners();
    }
  }

  void setSelectedCharacter(CharacterProfile? character) {
    _selectedCharacter = character;
    notifyListeners();
  }
}


class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final profiles = todoProvider.todoList.first.characterCompletion.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("오늘의 할 일"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CharacterSelection(profiles: profiles),
            SizedBox(height: 16),
            Expanded(
              child: TodoItemList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterSelection extends StatelessWidget {
  final List<CharacterProfile> profiles;

  CharacterSelection({required this.profiles});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return DropdownButton<CharacterProfile?>(
      value: todoProvider.selectedCharacter,
      hint: Text("캐릭터 선택 (전체보기)"),
      items: [
        DropdownMenuItem(
          value: null,
          child: Text("전체 캐릭터"),
        ),
        ...profiles.map((profile) => DropdownMenuItem(
          value: profile,
          child: Text(profile.nickname),
        )),
      ],
      onChanged: (CharacterProfile? value) {
        todoProvider.setSelectedCharacter(value);
      },
    );
  }
}


class TodoItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todoList = todoProvider.todoList;
    final selectedCharacter = todoProvider.selectedCharacter;

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todo = todoList[index];

        // 선택된 캐릭터가 있으면 해당 캐릭터의 TodoItemWidget만 표시
        if (selectedCharacter != null) {
          return TodoItemWidget(todo: todo, profile: selectedCharacter);
        } else {
          // 선택된 캐릭터가 없으면 모든 캐릭터의 TodoItemWidget을 표시
          return Column(
            children: todo.characterCompletion.keys.map((profile) => TodoItemWidget(todo: todo, profile: profile)).toList(),
          );
        }
      },
    );
  }
}


class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final CharacterProfile profile;

  TodoItemWidget({required this.todo, required this.profile});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    final isCashShopItem = todo.title == "캐시샵 무료 패션 아이템 구입";

    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text("${todo.title} (${profile.nickname})"),
            ),
            if (todo.totalCount > 1)
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => todoProvider.decrementTodoCount(todo),
                  ),
                  Text("${todo.completedCount} / ${todo.totalCount}"),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => todoProvider.incrementTodoCount(todo),
                  ),
                ],
              ),
            if (todo.totalCount == 1)
              Checkbox(
                value: todo.getCharacterCompletion(profile),
                onChanged: (bool? value) {
                  if (isCashShopItem) {
                    todoProvider.setAllCharactersComplete(todo, value ?? false);
                  } else {
                    todoProvider.toggleTodo(todo, profile, value ?? false);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  // 캐릭터 프로필 생성
  List<CharacterProfile> profiles = [
    CharacterProfile(server: "서버1", nickname: "Alice", className: "전사"),
    CharacterProfile(server: "서버2", nickname: "Bob", className: "마법사"),
  ];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider(profiles)),
      ],
      child: MaterialApp(
        home: TodoScreen(),
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:mabinogi/screens/character_creation_dialog.dart';
import 'package:mabinogi/screens/to_buy_screen.dart';
import 'package:mabinogi/screens/todo_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    final selectedCharacter = characterProvider.selectedCharacter;
    var isTodo = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('마비노기 헬퍼'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showCharacterCreationDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children:[
            ListTile(title: Text('ToDo'), onTap: (){
              isTodo = true;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },),
            ListTile(title: Text('ToBuy'), onTap: (){
              isTodo = false;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },),
            ListTile(title: Text('Equip'), onTap: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const EquipListScreen()),
              // );
            },),
          ]
        ),
      ),
      body:
          characterProvider.characterProfiles.isEmpty
              ? const Center(child: Text('보유하신 캐릭터가 없습니다. 캐릭터 정보를 입력해주세요!'))
              : Column(
                children: [
                  SizedBox(height: 100, child: CharacterSelectionWidget()),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (isTodo) ?
                        todoSection(selectedCharacter)
                        :
                        ToBuySection(selectedCharacter),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  void _showCharacterCreationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CharacterCreationDialog(),
    );
  }
}

class CharacterSelectionWidget extends StatelessWidget {
  const CharacterSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, characterProvider, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          
          itemCount: characterProvider.characterProfiles.length,
          itemBuilder: (context, index) {
            final character = characterProvider.characterProfiles[index];
            if (characterProvider.selectedCharacter == null && index == 0) {
              characterProvider.selectCharacter(character);
            }
            IconData? icon;
            if (character.className == ClassName.warrior.code ||
                character.className == ClassName.greatSwordWarrior.code ||
                character.className == ClassName.swordsman.code) {
              icon = Icons.shield;
            } else if (character.className == ClassName.magician.code ||
                character.className == ClassName.fireSorcerer.code ||
                character.className == ClassName.iceSorcerer.code) {
              icon = Icons.whatshot;
            } else if (character.className == ClassName.healer.code ||
                character.className == ClassName.monk.code ||
                character.className == ClassName.priest.code) {
              icon = Icons.health_and_safety_outlined;
            } else if (character.className == ClassName.archer.code ||
                character.className == ClassName.longBowman.code ||
                character.className == ClassName.crossbowman.code) {
              icon = Icons.arrow_upward;
            } else if (character.className == ClassName.bard.code ||
                character.className == ClassName.dancer.code ||
                character.className == ClassName.bard2.code) {
              icon = Icons.music_note;
            }
            return GestureDetector(
              onTap: () {
                characterProvider.selectCharacter(character);
              },
              child: Container(
                width: 150,
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: characterProvider.selectedCharacter == character
                      ? Colors.blue[100] //요거도 색 바꿔
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          characterProvider.selectedCharacter == character
                              ? Colors.black26
                              : Colors.transparent,
                      blurRadius: 4.0,
                      offset: Offset(2.0, 2.0),
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Text(character.nickname ?? 'No Nickname'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 24),
                        SizedBox(width: 4),
                        Text(
                          ClassName.fromCode(character.className).displayName,
                        ),
                      ],
                    ),
                    Text(Server.fromCode(character.server).displayName),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todoList;
  final String todoListType;
  final CharacterProfile characterProfile;

  const TodoList({
    super.key,
    required this.todoList,
    required this.todoListType,
    required this.characterProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, characterProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return Card(
              color: todo.isCompleted //요거도 색 바꿔
                  ? Colors.green[100]
                  : todo.completedCount > 0
                      ? Colors.yellow[100]
                      : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(todo.mission.title),
                    if (todo.mission.totalCount > 1)
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed:
                                todo.completedCount > 0
                                    ? () {
                                      characterProvider.updateTodo(
                                        characterProfile,
                                        todoListType,
                                        todo,
                                        todo.completedCount - 1,
                                      );
                                    }
                                    : null,
                          ),
                          Text(
                            '${todo.completedCount}/${todo.mission.totalCount}',
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed:
                                todo.completedCount < todo.mission.totalCount
                                    ? () {
                                      characterProvider.updateTodo(
                                        characterProfile,
                                        todoListType,
                                        todo,
                                        todo.completedCount + 1,
                                      );
                                    }
                                    : null,
                          ),
                        ],
                      )
                    else
                      Checkbox(
                        value: todo.isCompleted,
                        onChanged: (bool? newValue) {
                          characterProvider.updateTodo(
                            characterProfile,
                            todoListType,
                            todo,
                            newValue == true ? 1 : 0,
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AbisTodoWidget extends StatelessWidget {
  final List<Todo> todoList;
  final String todoListType;
  final CharacterProfile characterProfile;

  const AbisTodoWidget({
    super.key,
    required this.todoList,
    required this.todoListType,
    required this.characterProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, characterProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Difficulty.fromCode(
                        todo.mission.difficulty.code,
                      ).displayName,
                    ),
                    Row(
                      children: [
                        Text('타임어택'),
                        Checkbox(
                          value: todo.mission.completeTimeAttack,
                          onChanged: (bool? newValue) {
                            characterProvider.updateTimeAttack(
                              characterProfile,
                              todo,
                            );
                          },
                        ),
                        Text('주간 보상'),
                        Checkbox(
                          value: todo.isCompleted,
                          onChanged: (bool? newValue) {
                            characterProvider.updateTodo(
                              characterProfile,
                              todoListType,
                              todo,
                              newValue == true ? 1 : 0,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AbisTodoList extends StatelessWidget {
  final Map<String, List<Todo>> abis;
  final CharacterProfile characterProfile;

  const AbisTodoList({
    super.key,
    required this.abis,
    required this.characterProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          abis.entries.map((entry) {
            String abisName = entry.key;
            List<Todo> todoList = entry.value;

            return ExpansionTile(
              title: Text(abisName),
              children: [
                AbisTodoWidget(
                  todoList: todoList,
                  todoListType: 'abis',
                  characterProfile: characterProfile,
                ),
              ],
            );
          }).toList(),
    );
  }
}

class AccountTodoList extends StatelessWidget {
  const AccountTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, characterProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: characterProvider.accountTodo.length,
          itemBuilder: (context, index) {
            final todo = characterProvider.accountTodo[index];
            return GestureDetector(
              onTap: () {
                characterProvider.updateAccountTodo(
                  todo,
                  todo.completedCount == 0 ? 1 : 0,
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(todo.mission.title),
                      if (todo.mission.totalCount > 1)
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed:
                                  todo.completedCount > 0
                                      ? () {
                                        characterProvider.updateAccountTodo(
                                          todo,
                                          todo.completedCount - 1,
                                        );
                                      }
                                      : null,
                            ),
                            Text(
                              '${todo.completedCount}/${todo.mission.totalCount}',
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed:
                                  todo.completedCount < todo.mission.totalCount
                                      ? () {
                                        characterProvider.updateAccountTodo(
                                          todo,
                                          todo.completedCount + 1,
                                        );
                                      }
                                      : null,
                            ),
                          ],
                        )
                      else
                        Checkbox(
                          value: todo.isCompleted,
                          onChanged: (bool? newValue) {
                            characterProvider.updateAccountTodo(
                              todo,
                              newValue == true ? 1 : 0,
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

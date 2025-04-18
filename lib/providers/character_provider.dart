import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Import for JSON encoding/decoding

class CharacterProvider with ChangeNotifier {
  List<CharacterProfile> _characterProfiles = [];
  CharacterProfile? _selectedCharacter;
  List<Todo> accountTodo = [
    Todo(
      mission: Mission(
        title: '캐시샵 무료 패션 아이템 구입',
        totalCount: 1,
        difficulty: Difficulty.fromCode('normal'),
        resetCycle: ResetCycle.fromCode('daily'),
        completeTimeAttack: true,
        accountLimit: true,
      ),
      completedCount: 0,
      isCompleted: false,
    ),
  ];
  void addCharacter(CharacterProfile profile) {
    _characterProfiles.add(profile);
    notifyListeners();
  }

  void removeCharacter(CharacterProfile profile) {
    _characterProfiles.remove(profile);
    if (_selectedCharacter == profile) {
      _selectedCharacter = null; // Or select another character.
    }
    notifyListeners();
  }

  void selectCharacter(CharacterProfile profile) {
    _selectedCharacter = profile;
    notifyListeners();
  }

  void updateTodo(
    CharacterProfile profile,
    String todoListType,
    Todo todo,
    int newCompletedCount,
  ) {
    List<Todo>? targetList;

    switch (todoListType) {
      case 'daily':
        targetList = profile.dailyTodos;
        break;
      case 'weeklyBoss':
        targetList = profile.weeklyBoss;
        break;
      case 'abis':
        profile.abis.forEach((key, value) {
          if (value.contains(todo)) {
            targetList = value;
          }
        });
        break;
      case 'account':
        targetList = accountTodo;
        break;
      default:
        return;
    }

    if (targetList != null) {
      int index = targetList!.indexOf(todo);
      if (index != -1) {
        // Create a new Todo object with updated values
        Todo updatedTodo = Todo(
          mission: todo.mission,
          completedCount: newCompletedCount,
          isCompleted: newCompletedCount == todo.mission.totalCount,
        );

        // Replace the Todo in the list with the updated one
        targetList![index] = updatedTodo;
      }
      notifyListeners();
    }
  }

  void updateTimeAttack(CharacterProfile profile, Todo todo) {
    List<Todo>? targetList;

    profile.abis.forEach((key, value) {
      if (value.contains(todo)) {
        targetList = value;
      }
    });

    if (targetList != null) {
      int index = targetList!.indexOf(todo);
      if (index != -1) {
        Mission updateMission = todo.mission;
        updateMission.completeTimeAttack = !updateMission.completeTimeAttack;
        Todo updatedTodo = Todo(
          mission: updateMission,
          completedCount: todo.completedCount,
          isCompleted: todo.isCompleted,
        );

        // Replace the Todo in the list with the updated one
        targetList![index] = updatedTodo;
      }
      notifyListeners();
    }
  }

  void resetDailyTodosForCharacter(CharacterProfile profile) {
    profile.resetDailyTodos();
    notifyListeners();
  }

  void resetWeeklyBossTodosForCharacter(CharacterProfile profile) {
    profile.resetWeeklyBossTodos();
    notifyListeners();
  }

  void resetAbisTodosForCharacter(CharacterProfile profile) {
    profile.resetAbisTodos();
    notifyListeners();
  }

  //Account Todo
  void updateAccountTodo(Todo todo, int newCompletedCount) {
    int index = accountTodo.indexOf(todo);
    if (index != -1) {
      // Create a new Todo object with updated values
      Todo updatedTodo = Todo(
        mission: todo.mission,
        completedCount: newCompletedCount,
        isCompleted: newCompletedCount == todo.mission.totalCount,
      );

      // Replace the Todo in the list with the updated one
      accountTodo[index] = updatedTodo;
    }
    notifyListeners();
  }

  List<CharacterProfile> get characterProfiles => _characterProfiles;
  CharacterProfile? get selectedCharacter => _selectedCharacter;
  // Initialization, load data from SharedPreferences
  CharacterProvider() {
    loadCharacters();
  }

  // -- Persistence using SharedPreferences --
  Future<void> saveCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final characterList =
        _characterProfiles.map((e) => jsonEncode(characterToJson(e))).toList();
    await prefs.setStringList('characters', characterList);
  }

  Future<void> loadCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final characterList = prefs.getStringList('characters');
    if (characterList != null) {
      _characterProfiles =
          characterList.map((e) => characterFromJson(e)).toList();
      notifyListeners();
    }
  }

  String characterToJson(CharacterProfile character) {
    return jsonEncode({
      'server': character.server,
      'nickname': character.nickname,
      'className': character.className,
      'equipAcheivement':
          character.equipAcheivement
              .map((equip) => equipAcheivementToJson(equip))
              .toList(),
    });
  }

  CharacterProfile characterFromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return CharacterProfile(
        server: json['server'],
        nickname: json['nickname'],
        className: json['className'],
      )
      ..equipAcheivement =
          (json['equipAcheivement'] as List)
              .map((e) => equipAcheivementFromJson(e))
              .toList()
              .cast<EquipAcheivement>();
  }

  String toBuyToJson(ToBuy toBuy) {
    return jsonEncode({
      'item': sellInfoToJson(toBuy.item),
      'toBuy': toBuy.toBuy,
    });
  }

  ToBuy toBuyFromJson(dynamic json) {
    return ToBuy(item: sellInfoFromJson(json['item']), toBuy: json['toBuy']);
  }

  String equipAcheivementToJson(EquipAcheivement equip) {
    return jsonEncode({
      'equip': equipToJson(equip.equip),
      'foundPower': equip.foundPower,
      'isCompleted': equip.isCompleted,
    });
  }

  EquipAcheivement equipAcheivementFromJson(dynamic json) {
    Equip equipData = equipFromJson(json['equip']);
    EquipAcheivement equipAcheivement = EquipAcheivement(equip: equipData);
    equipAcheivement.foundPower = json['foundPower'];
    equipAcheivement.isCompleted = json['isCompleted'];
    return equipAcheivement;
  }

  String todoToJson(Todo todo) {
    return jsonEncode({
      'mission': missionToJson(todo.mission),
      'completedCount': todo.completedCount,
      'isCompleted': todo.isCompleted,
    });
  }

  Todo todoFromJson(dynamic json) {
    Mission missionData = missionFromJson(json['mission']);
    Todo todo = Todo(mission: missionData);
    todo.completedCount = json['completedCount'];
    todo.isCompleted = json['isCompleted'];
    return todo;
  }

  String sellInfoToJson(SellInfo sellInfo) {
    return jsonEncode({
      'item': itemToJson(sellInfo.item),
      'npc': sellInfo.npc,
      'sellType': sellInfo.sellType.code,
      'requiredItem': itemToJson(sellInfo.requiredItem),
      'sellAmount': sellInfo.sellAmount,
      'resetCycle': sellInfo.resetCycle.code,
      'accountLimit': sellInfo.accountLimit,
      'region': sellInfo.region.code,
    });
  }

  SellInfo sellInfoFromJson(dynamic json) {
    return SellInfo(
      item: itemFromJson(json['item']),
      npc: json['npc'],
      sellType: SellType.fromCode(json['sellType']),
      requiredItem: itemFromJson(json['requiredItem']),
      sellAmount: json['sellAmount'],
      resetCycle: ResetCycle.fromCode(json['resetCycle']),
      accountLimit: json['accountLimit'],
      region: Region.fromCode(json['region']),
    );
  }

  String itemToJson(Item item) {
    return jsonEncode({'name': item.name, 'amount': item.amount});
  }

  Item itemFromJson(dynamic json) {
    return Item(name: json['name'], amount: json['amount']);
  }

  String equipToJson(Equip equip) {
    return jsonEncode({
      'equipParts': equip.equipParts.code,
      'level': equip.level,
      'minPower': equip.minPower,
      'maxPower': equip.maxPower,
    });
  }

  Equip equipFromJson(dynamic json) {
    return Equip(
      equipParts: EquipParts.fromCode(json['equipParts']),
      level: json['level'],
      minPower: json['minPower'],
      maxPower: json['maxPower'],
    );
  }

  String missionToJson(Mission mission) {
    return jsonEncode({
      'title': mission.title,
      'totalCount': mission.totalCount,
      'difficulty': mission.difficulty.code,
      'resetCycle': mission.resetCycle.code,
      'completeTimeAttack': mission.completeTimeAttack,
      'accountLimit': mission.accountLimit,
    });
  }

  Mission missionFromJson(dynamic json) {
    return Mission(
      title: json['title'],
      totalCount: json['totalCount'],
      difficulty: json['difficulty'],
      resetCycle: ResetCycle.fromCode(json['resetCycle']),
      completeTimeAttack: json['completeTimeAttack'],
      accountLimit: json['accountLimit'],
    );
  }
}

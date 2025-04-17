import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Import for JSON encoding/decoding

class CharacterProvider with ChangeNotifier {
  List<CharacterProfile> _characterProfiles = [];
  CharacterProfile? _selectedCharacter;

  List<CharacterProfile> get characterProfiles => _characterProfiles;
  CharacterProfile? get selectedCharacter => _selectedCharacter;

  // Initialization, load data from SharedPreferences
  CharacterProvider() {
    loadCharacters();
  }

  void addCharacter(CharacterProfile character) {
    _characterProfiles.add(character);
    saveCharacters();
    notifyListeners();
  }

  void selectCharacter(CharacterProfile character) {
    _selectedCharacter = character;
    notifyListeners();
  }

  // CRUD operations for ToBuy, Todo, and EquipAchievement will go here, e.g.:
  void updateToBuy(CharacterProfile character, ToBuy toBuy, bool newValue) {
    toBuy.toBuy = newValue;
    saveCharacters(); // Persist changes immediately
    notifyListeners();
  }

  void addTodo(CharacterProfile character, Todo todo) {
    character.todoList.add(todo);
    saveCharacters();
    notifyListeners();
  }

  void updateTodo(CharacterProfile character, Todo todo) {
    // Logic to update the todo item (e.g., mark as complete)
    saveCharacters();
    notifyListeners();
  }

  void updateEquipAchievement(CharacterProfile character, EquipAcheivement equipAchievement, int newPower) {
      equipAchievement.setFoundPower(newPower);
      saveCharacters();
      notifyListeners();
  }

  // -- Persistence using SharedPreferences --
  Future<void> saveCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final characterList = _characterProfiles.map((e) => jsonEncode(characterToJson(e))).toList();
    await prefs.setStringList('characters', characterList);
  }

  Future<void> loadCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final characterList = prefs.getStringList('characters');
    if (characterList != null) {
      _characterProfiles = characterList.map((e) => characterFromJson(e)).toList();
      notifyListeners();
    }
  }

  String characterToJson(CharacterProfile character) {
    return jsonEncode({
      'server': character.server,
      'nickname': character.nickname,
      'className': character.className,
      'toBuyList': character.toBuyList.map((toBuy) => toBuyToJson(toBuy)).toList(),
      'equipAcheivement': character.equipAcheivement.map((equip) => equipAcheivementToJson(equip)).toList(),
      'todoList': character.todoList.map((todo) => todoToJson(todo)).toList(),
    });
  }

  CharacterProfile characterFromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return CharacterProfile(
      server: json['server'],
      nickname: json['nickname'],
      className: json['className'],
    )..toBuyList = (json['toBuyList'] as List).map((e) => toBuyFromJson(e)).toList().cast<ToBuy>()
    ..equipAcheivement = (json['equipAcheivement'] as List).map((e) => equipAcheivementFromJson(e)).toList().cast<EquipAcheivement>()
    ..todoList = (json['todoList'] as List).map((e) => todoFromJson(e)).toList().cast<Todo>();
  }

  String toBuyToJson(ToBuy toBuy) {
    return jsonEncode({
      'item': sellInfoToJson(toBuy.item),
      'toBuy': toBuy.toBuy,
    });
  }

  ToBuy toBuyFromJson(dynamic json) {
    return ToBuy(
        item: sellInfoFromJson(json['item']),
        toBuy: json['toBuy']);
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
    return jsonEncode({
      'name': item.name,
      'amount': item.amount,
    });
  }

  Item itemFromJson(dynamic json) {
    return Item(
      name: json['name'],
      amount: json['amount'],
    );
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
      'difficulty': mission.difficulty?.code,
      'resetCycle': mission.resetCycle.code,
      'completeTimeAttack': mission.completeTimeAttack,
      'accountLimit': mission.accountLimit,
    });
  }

  Mission missionFromJson(dynamic json) {
    return Mission(
      title: json['title'],
      totalCount: json['totalCount'],
      difficulty: json['difficulty'] != null ? Difficulty.fromCode(json['difficulty']) : null,
      resetCycle: ResetCycle.fromCode(json['resetCycle']),
      completeTimeAttack: json['completeTimeAttack'],
      accountLimit: json['accountLimit'],
    );
  }
}

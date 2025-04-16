import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:collection/collection.dart'; 

class CharacterProfile extends ChangeNotifier {
  String server;
  String nickname;
  String className;

  CharacterProfile({
    required this.server,
    required this.nickname,
    required this.className,
  });

  static Future<List<CharacterProfile>> loadProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final profilesJson = prefs.getStringList('characterProfiles') ?? [];
    return profilesJson.map((json) => CharacterProfile.fromJson(jsonDecode(json))).toList();
  }

  static Future<void> saveProfiles(List<CharacterProfile> profiles) async {
    final prefs = await SharedPreferences.getInstance();
    final profilesJson = profiles.map((profile) => jsonEncode(profile.toJson())).toList();
    await prefs.setStringList('characterProfiles', profilesJson);
  }

  CharacterProfile.fromJson(Map<String, dynamic> json)
      : server = json['server'],
        nickname = json['nickname'],
        className = json['className'];

  Map<String, dynamic> toJson() => {
        'server': server,
        'nickname': nickname,
        'className': className,
      };
  // CharacterProfile 비교를 위한 equals 메서드 오버라이드
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterProfile &&
          runtimeType == other.runtimeType &&
          server == other.server &&
          nickname == other.nickname &&
          className == other.className;

  @override
  int get hashCode => server.hashCode ^ nickname.hashCode ^ className.hashCode;
}

class CharacterProfileProvider extends ChangeNotifier {
  List<CharacterProfile> _profiles = [];

  CharacterProfileProvider() {
    loadProfiles();
  }

  List<CharacterProfile> get profiles => _profiles;

  Future<void> loadProfiles() async {
    _profiles = await CharacterProfile.loadProfiles();
    notifyListeners();
  }

  Future<void> saveProfile(CharacterProfile profile) async {
    _profiles.add(profile);
    await CharacterProfile.saveProfiles(_profiles);
    notifyListeners();
  }

  Future<void> updateProfile(int index, CharacterProfile updatedProfile) async {
    _profiles[index] = updatedProfile;
    await CharacterProfile.saveProfiles(_profiles);
    notifyListeners();
  }

  Future<void> deleteProfile(int index) async {
    _profiles.removeAt(index);
    await CharacterProfile.saveProfiles(_profiles);
    notifyListeners();
  }
}



class TodoItem {
  String title; // todo 이름
  int totalCount; // 가능 횟수
  int completedCount; // 완료 횟수
  Map<CharacterProfile, bool> characterCompletion; // 캐릭터별 완료 여부 (key: CharacterProfile, value: 완료 여부)

  TodoItem({
    required this.title,
    required this.totalCount,
    this.completedCount = 0,
    required this.characterCompletion,
  });

  // 완료 횟수를 증가시키는 메서드
  void incrementCompletedCount() {
    if (completedCount < totalCount) {
      completedCount++;
    }
  }

  // 특정 캐릭터의 완료 여부를 설정하는 메서드
  void setCharacterCompletion(CharacterProfile profile, bool isCompleted) {
    characterCompletion[profile] = isCompleted;
  }

  // 특정 캐릭터의 완료 여부를 가져오는 메서드
  bool getCharacterCompletion(CharacterProfile profile) {
    return characterCompletion[profile] ?? false; // 프로필이 없는 경우 false 반환
  }

  // TodoItem 비교를 위한 equals 메서드 오버라이드
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItem &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          totalCount == other.totalCount &&
          completedCount == other.completedCount &&
          DeepCollectionEquality().equals(characterCompletion, other.characterCompletion);

  @override
  int get hashCode =>
      title.hashCode ^
      totalCount.hashCode ^
      completedCount.hashCode ^
      DeepCollectionEquality().hash(characterCompletion);
}


// 초기 Todo 리스트 생성 함수
List<TodoItem> createInitialTodoList(List<CharacterProfile> profiles) {
  return [
    TodoItem(title: "검은 구멍", totalCount: 3, characterCompletion: {}),
    TodoItem(title: "불길한 소환의 결계", totalCount: 4, characterCompletion: {}),
    TodoItem(title: "필드 보스", totalCount: 100, characterCompletion: {}), // 횟수 임의 설정
    TodoItem(title: "주간 보스(페리)", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "주간 보스(크라브바흐)", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "주간 보스(크라마)", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "아르바이트", totalCount: 100, characterCompletion: {}), // 횟수 임의 설정
    TodoItem(title: "요일 던전", totalCount: 100, characterCompletion: {}), // 횟수 임의 설정
    TodoItem(title: "멸망의 탑", totalCount: 5, characterCompletion: {}),
    TodoItem(title: "어비스(입문)", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "어비스(어려움)", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "어비스(매우 어려움)", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "어비스(입문) 주간", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "어비스(어려움) 주간", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "어비스(매우 어려움) 주간", totalCount: 1, characterCompletion: {}),
    TodoItem(title: "캐시샵 무료 패션 아이템 구입", totalCount: 1, characterCompletion: {}),
  ].map((todo) {
    // 모든 캐릭터 프로필에 대해 기본적으로 완료되지 않은 상태로 초기화
    Map<CharacterProfile, bool> initialCompletion = {};
    for (var profile in profiles) {
      initialCompletion[profile] = false;
    }
    return TodoItem(
      title: todo.title,
      totalCount: todo.totalCount,
      completedCount: todo.completedCount,
      characterCompletion: initialCompletion,
    );
  }).toList();
}


class BuyItem {
  String name;
  int count;
  String npc;
  String type;
  String exchangeMaterial;
  int exchangeMaterialCount;
  int sellCount;
  String resetCycle;
  String accountLimit;
  bool buyCharacter1;
  bool buyCharacter2;
  bool buyCharacter3;
  bool buyHope;
  String region;
  bool wantToBuy;

  BuyItem({
    required this.name,
    this.wantToBuy = false,
    this.count = 0,
    required this.npc,
    required this.type,
    required this.exchangeMaterial,
    this.exchangeMaterialCount = 0,
    this.sellCount = 0,
    required this.resetCycle,
    required this.accountLimit,
    this.buyCharacter1 = false,
    this.buyCharacter2 = false,
    this.buyCharacter3 = false,
    this.buyHope = false,
    required this.region,
  });
}


import 'dart:collection';

import 'package:mabinogi/model/model.dart';

enum CraftType {
  refining('refining', '가공'),
  cook('cook', '요리'),
  crafting('crafting', '제작'),
  undefined('undefined', '');

  const CraftType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory CraftType.fromCode(String code) {
    return CraftType.values.firstWhere(
      (type) => type.code == code,
      orElse: () => CraftType.undefined,
    );
  }
}

class Recipe {
  Item goal;
  List<Item> materials;
  CraftType type = CraftType.crafting; // 제작 타입
  int minLevel = 0; // 최소 제작 레벨
  int recommendedLevel = 0; // 추천 제작 레벨
  int duration = 0; // 제작 시간(초)
  Recipe({
    required this.goal, required this.materials
  });
}

class Progress{
  Item item; // 제작 아이템
  int time = 0; // 제작 시간(초)
  bool isCompleted = false; // 완료 여부
  bool isStarted = false; // 시작 여부
  Progress({
    required this.item,
    required this.time,
  });
}

class Refiner{
  /*
  goal item (최대 4개)
  total required materials 
  total duration 
  예상 완료 시간 계산
   */
  Queue<Progress> goals = Queue(); // 목표 아이템 목록
  Queue<Item> completedItems = Queue(); // 완료 목록
  List<Item> materials = []; // 재료 목록
  int totalDuration = 0; // 총 제작 시간(초)
}

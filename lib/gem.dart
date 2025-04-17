
class Gem {
  String name;
  int level;
  List<Gem> recipe;

  Gem({
    required this.name,
    required this.level,
    required this.recipe,
  });
}

class OwnedGem {
  Gem gem;
  int count;

  OwnedGem({
    required this.gem,
    required this.count,
  });
}
// 예시 레시피 (실제 레시피는 게임에 따라 다름)
final gemRecipes = {
  "최상급 루비": Gem(name: "최상급 루비", level: 5, recipe: [
    Gem(name: "상급 루비", level: 4, recipe: []),
    Gem(name: "상급 루비", level: 4, recipe: []),
    Gem(name: "상급 루비", level: 4, recipe: []),
  ]),
  "상급 루비": Gem(name: "상급 루비", level: 4, recipe: [
    Gem(name: "일반 루비", level: 3, recipe: []),
    Gem(name: "일반 루비", level: 3, recipe: []),
    Gem(name: "일반 루비", level: 3, recipe: []),
  ]),
  "일반 루비": Gem(name: "일반 루비", level: 3, recipe: [
    Gem(name: "하급 루비", level: 2, recipe: []),
    Gem(name: "하급 루비", level: 2, recipe: []),
    Gem(name: "하급 루비", level: 2, recipe: []),
  ]),
  "하급 루비": Gem(name: "하급 루비", level: 2, recipe: [
    Gem(name: "루비 조각", level: 1, recipe: []),
    Gem(name: "루비 조각", level: 1, recipe: []),
    Gem(name: "루비 조각", level: 1, recipe: []),
  ]),
  "루비 조각": Gem(name: "루비 조각", level: 1, recipe: []), // 최하위 보석은 레시피 없음
};
// 필요한 보석 개수를 계산하는 재귀 함수
Map<String, int> calculateRequiredGems(Gem targetGem, int targetCount, Map<String, int> ownedGems) {
  Map<String, int> requiredGems = {};

  // 1. 목표 보석 필요 개수 계산
  requiredGems[targetGem.name] = targetCount;

  // 2. 레시피가 있는 경우 하위 보석 필요 개수 계산
  if (targetGem.recipe.isNotEmpty) {
    int recipeCount = targetCount; // 목표 보석 개수만큼 레시피 반복

    for (Gem ingredient in targetGem.recipe) {
      // 각 하위 재료에 대해 필요한 개수 계산
      Map<String, int> subRequired = calculateRequiredGems(ingredient, recipeCount, ownedGems);

      // 하위 재료의 필요 개수를 합산
      subRequired.forEach((gemName, gemCount) {
        requiredGems.update(gemName, (existingCount) => existingCount + gemCount, ifAbsent: () => gemCount);
      });
    }
  }

  // 3. 보유량 차감
  ownedGems.forEach((gemName, gemCount) {
    if (requiredGems.containsKey(gemName)) {
      int needed = requiredGems[gemName]!;
      int available = gemCount;

      // 보유량보다 필요량이 적거나 같은 경우
      if (needed <= available) {
        requiredGems[gemName] = 0;
        ownedGems[gemName] = available - needed; // 보유량 갱신
      } else { // 보유량보다 필요량이 많은 경우
        requiredGems[gemName] = needed - available;
        ownedGems[gemName] = 0; // 보유량 0으로 갱신
      }
    }
  });

  return requiredGems;
}

// 합성 경로를 생성하는 함수 (텍스트 기반)
String generateSynthesisPath(Gem targetGem, int count, Map<String, int> ownedGems, String indent) {
  String path = "";

  if (targetGem.recipe.isEmpty) {
    return "$indent- ${targetGem.name} x $count\n";
  }

  path += "$indent+ ${targetGem.name} x $count\n";
  for (Gem ingredient in targetGem.recipe) {
    path += generateSynthesisPath(ingredient, count, ownedGems, indent + "  ");
  }

  return path;
}

void main() {
  // 보유 보석 정보
  Map<String, int> ownedGems = {
    "루비 조각": 100,
    "하급 루비": 20,
    "일반 루비": 5,
    "상급 루비": 2,
    "최상급 루비": 0,
  };

  // 목표 보석
  String targetGemName = "최상급 루비";
  int targetGemCount = 1;

  // 레시피 정보
  Gem targetGem = gemRecipes[targetGemName]!;

  // 필요 보석 계산
  Map<String, int> requiredGems = calculateRequiredGems(targetGem, targetGemCount, ownedGems);

  // 합성 경로 생성
  String synthesisPath = generateSynthesisPath(targetGem, targetGemCount, ownedGems, "");

  // 결과 출력
  print("### 필요 보석: ###");
  requiredGems.forEach((gemName, gemCount) {
    if (gemCount > 0) {
      print("- $gemName: $gemCount");
    }
  });

  print("\n### 합성 경로: ###");
  print(synthesisPath);

  print("\n### 변경된 보유량: ###");
  ownedGems.forEach((gemName, gemCount) {
    print("- $gemName: $gemCount");
  });
}
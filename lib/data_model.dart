class TodoItem {
  String name;
  int possibleCount;
  bool character1;
  bool character2;
  bool character3;

  TodoItem({
    required this.name,
    this.possibleCount = 0,
    this.character1 = false,
    this.character2 = false,
    this.character3 = false,
  });
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

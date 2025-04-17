
class Rune {
  String name;
  Grade grade;
  RunePart type;
  String description;

  Rune({
    required this.name,
    required this.grade,
    required this.type,
    required this.description,
  });
}
enum RunePart{
  weapon('weapon', '무기'),
  defense('defense', '방어구'),
  accesary('accesary', '악세사리'),
  emblem('emblem', '엠블렘');

  const RunePart(this.code, this.displayName);
  final String code;
  final String displayName;

  factory RunePart.fromCode(String code) {
    return RunePart.values.firstWhere(
      (type) => type.code == code,
      orElse: () => RunePart.defense,
    );
  }
}
enum Grade{
  high('high', '고급'),
  rare('rare', '희귀'),
  elite('elite', '엘리트'),
  epic('epic', '에픽'),
  legendary('legendary', '전설');

  const Grade(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Grade.fromCode(String code) {
    return Grade.values.firstWhere(
      (type) => type.code == code,
      orElse: () => Grade.high,
    );
  }
}

class RuneSlot {
  RunePart part; // 슬롯에 장착 가능한 룬 부위
  Rune? rune; // 장착된 룬 (null이면 비어있음)

  RuneSlot({
    required this.part,
    this.rune,
  });

  // 룬 장착 가능 여부 확인
  bool canEquip(Rune rune) {
    return rune.type == part && this.rune == null; // 같은 부위이고, 슬롯이 비어있어야 함
  }

  // 룬 장착
  void equip(Rune rune) {
    if (canEquip(rune)) {
      this.rune = rune;
    } else {
      print("해당 룬은 이 슬롯에 장착할 수 없습니다.");
    }
  }

  // 룬 해제
  void unequip() {
    this.rune = null;
  }
}
List<RuneSlot> createRuneSlots() {
  return [
    RuneSlot(part: RunePart.weapon),      // 무기 룬 슬롯 (1개)
    RuneSlot(part: RunePart.defense),     // 방어구 룬 슬롯 (5개)
    RuneSlot(part: RunePart.defense),
    RuneSlot(part: RunePart.defense),
    RuneSlot(part: RunePart.defense),
    RuneSlot(part: RunePart.defense),
    RuneSlot(part: RunePart.accesary),    // 장신구 룬 슬롯 (3개)
    RuneSlot(part: RunePart.accesary),
    RuneSlot(part: RunePart.accesary),
    RuneSlot(part: RunePart.emblem),      // 엠블렘 룬 슬롯 (1개)
  ];
}
void main() {
  // 룬 슬롯 생성
  List<RuneSlot> runeSlots = createRuneSlots();

  // 룬 데이터 (가정)
  Rune weaponRune = Rune(name: "무기 룬", grade: Grade.epic, type: RunePart.weapon, description: "무기 공격력 증가");
  Rune defenseRune = Rune(name: "방어구 룬", grade: Grade.rare, type: RunePart.defense, description: "방어력 증가");
  Rune accesaryRune = Rune(name: "장신구 룬", grade: Grade.elite, type: RunePart.accesary, description: "체력 증가");
  Rune emblemRune = Rune(name: "엠블렘 룬", grade: Grade.high, type: RunePart.emblem, description: "마나 증가");

  // 룬 장착 시도
  runeSlots[0].equip(weaponRune);   // 무기 룬 슬롯에 무기 룬 장착 (성공)
  runeSlots[1].equip(defenseRune);  // 방어구 룬 슬롯에 방어구 룬 장착 (성공)
  runeSlots[6].equip(accesaryRune);   // 장신구 룬 슬롯에 장신구 룬 장착 (성공)
  runeSlots[9].equip(emblemRune);      // 엠블렘 룬 슬롯에 엠블렘 룬 장착 (성공)

  runeSlots[0].equip(defenseRune);  // 무기 룬 슬롯에 방어구 룬 장착 (실패) - 다른 부위
  runeSlots[1].equip(weaponRune);   // 방어구 룬 슬롯에 무기 룬 장착 (실패) - 다른 부위

  // 장착된 룬 정보 출력
  for (int i = 0; i < runeSlots.length; i++) {
    RuneSlot slot = runeSlots[i];
    print("슬롯 ${i + 1}: ${slot.part.displayName} 룬 - ${slot.rune?.name ?? '비어 있음'}");
  }

  // 룬 해제
  runeSlots[0].unequip();
  print("슬롯 1: ${runeSlots[0].part.displayName} 룬 - ${runeSlots[0].rune?.name ?? '비어 있음'}");
}
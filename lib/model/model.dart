enum Server {
  deian('deian', '데이안'),
  aira('aira', '아이라'),
  duncan('duncan', '던컨'),
  alisa('alisa', '알리사'),
  maven('maven', '메이븐'),
  lhasa('lhasa', '라사'),
  calyx('calyx', '칼릭스');

  const Server(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Server.fromCode(String code) {
    return Server.values.firstWhere(
      (type) => type.code == code,
      orElse: () => Server.duncan,
    );
  }
}

enum ClassName {
  warrior('warrior', '전사'),
  greatSwordWarrior('greatSwordWarrior', '대검전사'),
  swordsman('swordsman', '검술사'),
  archer('archer', '궁수'),
  longBowman('longBowman', '장궁병'),
  crossbowman('crossbowman', '석궁사수'),
  magician('magician', '마법사'),
  fireSorcerer('fireSorcerer', '화염술사'),
  iceSorcerer('iceSorcerer', '빙결술사'),
  healer('healer', '힐러'),
  priest('priest', '사제'),
  monk('monk', '수도사'),
  bard('bard', '음유시인'),
  bard2('bard2', '악사'),
  dancer('dancer', '댄서');

  const ClassName(this.code, this.displayName);
  final String code;
  final String displayName;

  factory ClassName.fromCode(String code) {
    return ClassName.values.firstWhere(
      (type) => type.code == code,
      orElse: () => ClassName.warrior,
    );
  }
}

class CharacterProfile {
  /*
    기본 정보: 서버, 이름, 직업
    이름 default = "캐릭터${i}" automatically generated
  */
  String server;
  String? nickname;
  String className;

  List<EquipAcheivement> equipAcheivement = [];
  List<Todo> dailyTodos = [
    Todo(mission:
    Mission(
      title: '검은 구멍',
      totalCount: 3,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('daily'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '불길한 소환의 결계',
      totalCount: 4,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('daily'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission: 
    Mission(
      title: '필드 보스',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('daily'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '아르바이트',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('daily'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '요일 던전',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('daily'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission: 
    Mission(
      title: '멸망의 탑',
      totalCount: 5,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('daily'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
  ];
  List<Todo> weeklyBoss = [
    Todo(mission: 
    Mission(
      title: '페리',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission: 
    Mission(
      title: '크라브바흐',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '크라마',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: true,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    
  ];
  Map<String, List<Todo>> abis = {
    '가라앉은 유적': [
      Todo(mission:
      Mission(
      title: '가라앉은 유적',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
      completedCount: 0,
      isCompleted: false,
      ),
      Todo(mission: 
      Mission(
      title: '가라앉은 유적',
      totalCount: 1,
      difficulty: Difficulty.fromCode('hard'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
      completedCount: 0,
      isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '가라앉은 유적',
      totalCount: 1,
      difficulty: Difficulty.fromCode('extreme'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    ],
    '무너진 제단': [
    Todo(mission:
    
    Mission(
      title: '무너진 제단',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '무너진 제단',
      totalCount: 1,
      difficulty: Difficulty.fromCode('hard'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '무너진 제단',
      totalCount: 1,
      difficulty: Difficulty.fromCode('extreme'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    ],
    '파멸의 전당':[
    Todo(mission:  
    Mission(
      title: '파멸의 전당',
      totalCount: 1,
      difficulty: Difficulty.fromCode('normal'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '파멸의 전당',
      totalCount: 1,
      difficulty: Difficulty.fromCode('hard'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    Todo(mission:
    Mission(
      title: '파멸의 전당',
      totalCount: 1,
      difficulty: Difficulty.fromCode('extreme'),
      resetCycle: ResetCycle.fromCode('weekly'),
      completeTimeAttack: false,
    ),
    completedCount: 0,
    isCompleted: false,
    ),
    ]
  
  };

  List<ToBuy> cashShop = [
    ToBuy(item:SellInfo(item: Item(name: '일일 은동전 상자', amount: 1), npc: '캐시샵', sellType: SellType.cashDeca, requiredItem: Item(name: '데카', amount: 120), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.cashshop), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '조각난 보석 보물 상자', amount: 1), npc: '캐시샵', sellType: SellType.cashGold, requiredItem: Item(name: '골드', amount: 4000), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.cashshop), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '주간 마족 공물 상자', amount: 1), npc: '캐시샵', sellType: SellType.cashDeca, requiredItem: Item(name: '데카', amount: 1500), sellAmount: 1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.cashshop), toBuy: false),

  ];
  List<ToBuy> tirconail = [
    


ToBuy(item:SellInfo(item: Item(name: '다목적 제작대 설계도(3레벨)', amount: 1), npc: '말콤', sellType: SellType.trade, requiredItem: Item(name: '전문 캠프파이어 키트', amount: 1), sellAmount: 1, resetCycle: ResetCycle.account, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '식재료 가공 시설 설계도(3레벨)', amount: 1), npc: '케이틴', sellType: SellType.trade, requiredItem: Item(name: '밀가루', amount: 10), sellAmount: 1, resetCycle: ResetCycle.account, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '여행자 간식', amount: 1), npc: '노라', sellType: SellType.trade, requiredItem: Item(name: '말콤의 푹신한 양털 베개', amount: 1), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 양털', amount: 4), npc: '데이안', sellType: SellType.trade, requiredItem: Item(name: '펫 먹이', amount: 1), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '네잎클로버', amount: 1), npc: '딜리스', sellType: SellType.material, requiredItem: Item(name: '쑥쑥 버섯', amount: 3), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '고급 연금술 재연소 촉매', amount: 1), npc: '라사', sellType: SellType.trade, requiredItem: Item(name: '사과 주스', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '고급 연금술 재연소 촉매', amount: 1), npc: '라사', sellType: SellType.trade, requiredItem: Item(name: '연금술 부스러기', amount: 3), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '레어 연금술 재연소 촉매', amount: 1), npc: '라사', sellType: SellType.trade, requiredItem: Item(name: '고급 연금술 재연소 촉매 ', amount: 15), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '치명타 비약', amount: 1), npc: '레이널드', sellType: SellType.trade, requiredItem: Item(name: '마요네즈 고기볶음', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '빈 악보', amount: 1), npc: '말콤', sellType: SellType.trade, requiredItem: Item(name: '양털', amount: 50), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '말콤의 푹신한 양털 베개', amount: 1), npc: '말콤', sellType: SellType.trade, requiredItem: Item(name: '거미줄', amount: 5), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '성수', amount: 1), npc: '메이븐', sellType: SellType.trade, requiredItem: Item(name: '케이틴 특제 통밀빵', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '밀가루', amount: 1), npc: '알리사', sellType: SellType.trade, requiredItem: Item(name: '달걀', amount: 3), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '밀가루', amount: 1), npc: '알리사', sellType: SellType.trade, requiredItem: Item(name: '라벤더 꽃', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '성수', amount: 1), npc: '엔델리온', sellType: SellType.trade, requiredItem: Item(name: '케이틴 특제 통밀빵', amount: 10), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '케이틴 특제 통밀빵', amount: 1), npc: '케이틴', sellType: SellType.trade, requiredItem: Item(name: '우유', amount: 10), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '철 광석', amount: 1), npc: '퍼거스', sellType: SellType.trade, requiredItem: Item(name: '분해된 장비 부품', amount: 1), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '석탄', amount: 1), npc: '퍼거스', sellType: SellType.trade, requiredItem: Item(name: '분해된 장비 부품', amount: 1), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '합금강괴', amount: 1), npc: '퍼거스', sellType: SellType.trade, requiredItem: Item(name: '강철괴', amount: 2), sellAmount: 4, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '블러디 허브', amount: 1), npc: '딜리스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.noLimit, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '새록 버섯', amount: 1), npc: '딜리스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.noLimit, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '펫 먹이', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 5), sellAmount: 30, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '정령의 날개', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 3), sellAmount: 30, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '성수 묶음 상자', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 17), sellAmount: 30, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '정령의 흔적', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 10), sellAmount: 30, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 강화 비약 선택 상자', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 1), sellAmount: 20, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '저주 해제 물약', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 20), sellAmount: 10, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '강화 재연소 촉매', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 50), sellAmount: 20, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '룬의 파편', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 100), sellAmount: 1, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '작은 연금술 촉매 상자', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 260), sellAmount: 1, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '보석 스킬 세공기', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 200), sellAmount: 2, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '룬 재설정 프리즘', amount: 1), npc: '이상한 고양이', sellType: SellType.event, requiredItem: Item(name: '이상한 발바닥 스탬프', amount: 200), sellAmount: 2, resetCycle: ResetCycle.onEvent, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '룬의 파편 ', amount: 10), npc: '던컨, 에반, 케아라', sellType: SellType.cert, requiredItem: Item(name: '마물 퇴치 증표', amount: 20), sellAmount: 20, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '불사의 가루', amount: 1), npc: '던컨, 에반, 케아라', sellType: SellType.cert, requiredItem: Item(name: '마물 퇴치 증표', amount: 100), sellAmount: 5, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '저주 해제 물약', amount: 1), npc: '던컨, 에반, 케아라', sellType: SellType.cert, requiredItem: Item(name: '마물 퇴치 증표', amount: 100), sellAmount: 10, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '아득한 별의 인장', amount: 1), npc: '던컨, 에반, 케아라', sellType: SellType.cert, requiredItem: Item(name: '마물 퇴치 증표', amount: 200), sellAmount: 1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '강화 재연소 촉매', amount: 1), npc: '던컨, 에반, 케아라', sellType: SellType.cert, requiredItem: Item(name: '마물 퇴치 증표', amount: 300), sellAmount: 1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '빈 병', amount: 1), npc: '말콤', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 50), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '종이', amount: 1), npc: '말콤', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 100), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '생가죽', amount: 1), npc: '말콤', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '옷감', amount: 1), npc: '말콤', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 500), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '장수풍뎅이', amount: 1), npc: '말콤', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 500), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '빈 병', amount: 1), npc: '엔델리온', sellType: SellType.consume, requiredItem: Item(name: '골드', amount: 50), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '성수', amount: 1), npc: '엔델리온', sellType: SellType.consume, requiredItem: Item(name: '골드', amount: 1500), sellAmount: 5, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '달걀 샌드위치', amount: 1), npc: '케이틴', sellType: SellType.food, requiredItem: Item(name: '골드', amount: 900), sellAmount: 3, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '치즈 빵 ', amount: 1), npc: '케이틴', sellType: SellType.food, requiredItem: Item(name: '골드', amount: 900), sellAmount: 3, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '삶은 달걀 ', amount: 1), npc: '케이틴', sellType: SellType.food, requiredItem: Item(name: '골드', amount: 900), sellAmount: 3, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '고기', amount: 1), npc: '케이틴', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '소금', amount: 1), npc: '케이틴', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '설탕', amount: 1), npc: '케이틴', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1200), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '사과', amount: 1), npc: '케이틴', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 800), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '양배추', amount: 1), npc: '케이틴', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 800), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '식용유', amount: 1), npc: '케이틴', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1200), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.tirconail), toBuy: false),
  ];
  List<ToBuy> dugaldhail = [
    ToBuy(item:SellInfo(item: Item(name: '타닌 가루', amount: 5), npc: '엘빈', sellType: SellType.trade, requiredItem: Item(name: '생가죽', amount: 5), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 통나무', amount: 1), npc: '엘빈', sellType: SellType.trade, requiredItem: Item(name: '상급 가죽', amount: 1), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 목재', amount: 4), npc: '엘빈', sellType: SellType.trade, requiredItem: Item(name: '야채 볶음', amount: 1), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '가죽 가공 시설 설계도(3레벨)', amount: 1), npc: '엘빈', sellType: SellType.trade, requiredItem: Item(name: '옷감+', amount: 5), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '생가죽', amount: 1), npc: '트레이시', sellType: SellType.trade, requiredItem: Item(name: '통나무', amount: 1), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 생가죽', amount: 1), npc: '트레이시', sellType: SellType.trade, requiredItem: Item(name: '통나무', amount: 10), sellAmount: 10, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '나무 진액', amount: 4), npc: '트레이시', sellType: SellType.trade, requiredItem: Item(name: '상급 통나무', amount: 1), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '트레이시의 원목 오르골', amount: 1), npc: '트레이시', sellType: SellType.trade, requiredItem: Item(name: '조개찜', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '목재 가공 시설 설계도(3레벨)', amount: 1), npc: '트레이시', sellType: SellType.trade, requiredItem: Item(name: '애벌레', amount: 5), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dugaldhail), toBuy: false),
  ];
  List<ToBuy> dunbaton = [
    ToBuy(item:SellInfo(item: Item(name: '글리니스 수제 케이크', amount: 1), npc: '글리니스', sellType: SellType.trade, requiredItem: Item(name: '포크 인 밀크', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '글리니스의 애플 밀크티', amount: 1), npc: '글리니스', sellType: SellType.trade, requiredItem: Item(name: '생크림', amount: 4), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '음식 제작대 설계도(3레벨)', amount: 1), npc: '글리니스', sellType: SellType.trade, requiredItem: Item(name: '사과 수플레', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 생가죽', amount: 1), npc: '네리스', sellType: SellType.trade, requiredItem: Item(name: '동 광석', amount: 10), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '특수강괴', amount: 1), npc: '네리스', sellType: SellType.trade, requiredItem: Item(name: '합금강괴', amount: 4), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '생명의 마나석', amount: 1), npc: '마누스', sellType: SellType.trade, requiredItem: Item(name: '펫 먹이', amount: 10), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 목재', amount: 16), npc: '발터', sellType: SellType.trade, requiredItem: Item(name: '트레이시의 원목 오르골', amount: 1), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '하트 토큰', amount: 1), npc: '발터', sellType: SellType.trade, requiredItem: Item(name: '참사랑어', amount: 5), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '화염 마법 유탄', amount: 1), npc: '발터', sellType: SellType.trade, requiredItem: Item(name: '어둠유령고기', amount: 5), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '번개 마법 유탄', amount: 1), npc: '발터', sellType: SellType.trade, requiredItem: Item(name: '어둠유령고기', amount: 5), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '바람 마법 유탄', amount: 1), npc: '발터', sellType: SellType.trade, requiredItem: Item(name: '어둠유령고기', amount: 5), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '신성 마법 유탄', amount: 1), npc: '발터', sellType: SellType.trade, requiredItem: Item(name: '어둠유령고기', amount: 5), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '불꽃의 결정', amount: 1), npc: '스튜어트', sellType: SellType.trade, requiredItem: Item(name: '연금술 부스러기', amount: 1), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '얼음의 결정', amount: 1), npc: '스튜어트', sellType: SellType.trade, requiredItem: Item(name: '연금술 부스러기', amount: 1), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '전기의 결정', amount: 1), npc: '스튜어트', sellType: SellType.trade, requiredItem: Item(name: '연금술 부스러기', amount: 1), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '광휘의 결정', amount: 1), npc: '스튜어트', sellType: SellType.trade, requiredItem: Item(name: '연금술 부스러기', amount: 1), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '봉인의 결정', amount: 1), npc: '스튜어트', sellType: SellType.trade, requiredItem: Item(name: '연금술 부스러기', amount: 1), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '염색약 베이스', amount: 1), npc: '시몬', sellType: SellType.trade, requiredItem: Item(name: '상급 실크', amount: 10), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '옷감 가공 시설 설계도(3레벨)', amount: 1), npc: '시몬', sellType: SellType.trade, requiredItem: Item(name: '유령 반딧불이', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '방어구 제작대 설계도(3레벨)', amount: 1), npc: '시몬', sellType: SellType.trade, requiredItem: Item(name: '세공된 페리도트S', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '정령의 흔적', amount: 20), npc: '아란웰', sellType: SellType.trade, requiredItem: Item(name: '클래스 마스터 레벨', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '궁극기 비약', amount: 1), npc: '아란웰', sellType: SellType.trade, requiredItem: Item(name: '감자 샐러드', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '종이', amount: 10), npc: '아이라', sellType: SellType.trade, requiredItem: Item(name: '주인 없는 소설책', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '실크', amount: 4), npc: '제롬', sellType: SellType.trade, requiredItem: Item(name: '리코타 치즈 샐러드', amount: 1), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 실크', amount: 4), npc: '제롬', sellType: SellType.trade, requiredItem: Item(name: '크림소스 스테이크', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 옷감', amount: 4), npc: '제이미', sellType: SellType.trade, requiredItem: Item(name: '사과 수플레', amount: 1), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 옷감+', amount: 4), npc: '제이미', sellType: SellType.trade, requiredItem: Item(name: '사과 생크림케이크', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 옷감+', amount: 4), npc: '제이미', sellType: SellType.trade, requiredItem: Item(name: '사과 생크림케이크', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 목재+', amount: 1), npc: '칼릭스', sellType: SellType.trade, requiredItem: Item(name: '글리니스의 애플 밀크티', amount: 3), sellAmount: 2, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '주인 없는 소설책', amount: 1), npc: '플로라', sellType: SellType.trade, requiredItem: Item(name: '글리니스 수제 케이크', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '구운 고기', amount: 1), npc: '글리니스', sellType: SellType.food, requiredItem: Item(name: '골드', amount: 3000), sellAmount: 3, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '통감자구이', amount: 1), npc: '글리니스', sellType: SellType.food, requiredItem: Item(name: '골드', amount: 3000), sellAmount: 3, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '사과 주스', amount: 1), npc: '글리니스', sellType: SellType.food, requiredItem: Item(name: '골드', amount: 3000), sellAmount: 3, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '고기', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '소금', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '설탕', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1200), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '양배추', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 800), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '식용유', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1200), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '사과', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 800), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '마늘', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1200), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '후추', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 2000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '레몬', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 3000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '토마토', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 6800), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '아스파라거스', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 10000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '완두콩', amount: 1), npc: '글리니스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 10000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '블러디 허브', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '화살꽃', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 400), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '마나 허브', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '끈기 풀', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 400), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '튼튼 버섯 가루', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '튼튼 버섯 진액', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '쑥쑥 버섯', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '쑥쑥 버섯 진액', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '새록 버섯 진액', amount: 1), npc: '마누스', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 400), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '빈 병', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 50), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '종이', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 100), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '생가죽', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 생가죽', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '옷감', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 500), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '똑딱 반딧불이', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 400), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '흰꽃나비', amount: 1), npc: '발터', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 40), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '기본 안경 선택 상자', amount: 1), npc: '시몬', sellType: SellType.glasses, requiredItem: Item(name: '골드', amount: 10000), sellAmount: 1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '각종 제작 가이드북', amount: 1), npc: '아이라', sellType: SellType.consume, requiredItem: Item(name: '골드', amount: 900), sellAmount: 1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '빈 병', amount: 1), npc: '크리스텔', sellType: SellType.consume, requiredItem: Item(name: '골드', amount: 50), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '성수', amount: 1), npc: '크리스텔', sellType: SellType.consume, requiredItem: Item(name: '골드', amount: 1500), sellAmount: 5, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '성수', amount: 1), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 10), sellAmount: 20, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '펫 먹이', amount: 1), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 10), sellAmount: 20, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '통감자구이', amount: 2), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 5), sellAmount: 2, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '감자 샐러드', amount: 2), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 5), sellAmount: 2, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '사과 주스', amount: 2), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 5), sellAmount: 2, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '사과 샐러드', amount: 2), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 5), sellAmount: 2, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '구운 고기', amount: 2), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 5), sellAmount: 2, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '마요네즈 고기볶음', amount: 2), npc: '플로라, 티이', sellType: SellType.dailySale, requiredItem: Item(name: '하트 토큰', amount: 5), sellAmount: 2, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.dunbaton), toBuy: false),
  ];
  List<ToBuy> colhen = [
    ToBuy(item:SellInfo(item: Item(name: '분해된 장비 부품', amount: 1), npc: '아르미스', sellType: SellType.trade, requiredItem: Item(name: '특수강괴', amount: 1), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '동 광석', amount: 10), npc: '아르미스', sellType: SellType.trade, requiredItem: Item(name: '백동 광석', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '금속 가공 시설 설계도(3레벨)', amount: 1), npc: '아르미스', sellType: SellType.trade, requiredItem: Item(name: '석탄', amount: 20), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '무기 제작대 설계도(3레벨)', amount: 1), npc: '아르미스', sellType: SellType.trade, requiredItem: Item(name: '내열 붕대', amount: 5), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '펫 먹이', amount: 10), npc: '카린', sellType: SellType.trade, requiredItem: Item(name: '감자 수프', amount: 3), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '협곡의 마나석', amount: 1), npc: '케아라', sellType: SellType.trade, requiredItem: Item(name: '상급 생가죽+', amount: 10), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '폐허의 마나석', amount: 1), npc: '케아라', sellType: SellType.trade, requiredItem: Item(name: '상급 생가죽+', amount: 10), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 치명타 비약', amount: 1), npc: '케아라', sellType: SellType.trade, requiredItem: Item(name: '얼음 딸기주스', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '네잎클로버', amount: 1), npc: '코너', sellType: SellType.trade, requiredItem: Item(name: '건강 드링크', amount: 1), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '폐허의 마나석', amount: 1), npc: '코너', sellType: SellType.trade, requiredItem: Item(name: '초롱아귀', amount: 5), sellAmount: 3, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '건강 드링크', amount: 1), npc: '킬리언', sellType: SellType.trade, requiredItem: Item(name: '깔끔 버섯 포자', amount: 5), sellAmount: 5, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '네잎클로버', amount: 2), npc: '킬리언', sellType: SellType.trade, requiredItem: Item(name: '알리오 올리오', amount: 1), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '약품 가공 시설 설계도(3레벨)', amount: 1), npc: '킬리언', sellType: SellType.trade, requiredItem: Item(name: '독주머니', amount: 3), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '약품 제작대 설계도(3레벨)', amount: 1), npc: '킬리언', sellType: SellType.trade, requiredItem: Item(name: '석양나비', amount: 2), sellAmount: 1, resetCycle: ResetCycle.daily, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '빈 병', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 50), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '종이', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 100), sellAmount: -1, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '고기', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 250), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '조개', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '얼음', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '딸기', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 1200), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '후추', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 2000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '토마토', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 6800), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '아스파라거스', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 10000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '완두콩', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 10000), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 생가죽', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '상급 생가죽+', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '장수풍뎅이', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 500), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '똑딱 반딧불이', amount: 1), npc: '코너', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 400), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '네잎클로버', amount: 1), npc: '킬리언', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 750), sellAmount: 5, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '슴슴꽃', amount: 1), npc: '킬리언', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 150), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '슴슴꽃 가루', amount: 1), npc: '킬리언', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 900), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '튼튼 버섯 가루', amount: 1), npc: '킬리언', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '깔끔 버섯', amount: 1), npc: '킬리언', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 600), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
ToBuy(item:SellInfo(item: Item(name: '깔끔 버섯 진액', amount: 1), npc: '킬리언', sellType: SellType.material, requiredItem: Item(name: '골드', amount: 750), sellAmount: 30, resetCycle: ResetCycle.weekly, accountLimit: false, region: Region.colhen), toBuy: false),
  ];

  CharacterProfile({
    required this.server,
    this.nickname,
    required this.className,
  });
  void resetDailyTodos() {
    dailyTodos = dailyTodos.map((todo) {
      return Todo(mission: todo.mission, completedCount: 0, isCompleted: false);
    }).toList();
  }

  void resetWeeklyBossTodos() {
    weeklyBoss = weeklyBoss.map((todo) {
      return Todo(mission: todo.mission, completedCount: 0, isCompleted: false);
    }).toList();
  }
  void resetAbisTodos() {
     abis.forEach((key, value) {
       abis[key] = value.map((todo) {
         return Todo(mission: todo.mission, completedCount: 0, isCompleted: false);
       }).toList();
     });
  }
}


class Item {
  /*
    아이템 이름, 아이템 개수
  */
  String name;
  int amount;
  Item({required this.name, required this.amount});
}

enum SellType {
  trade('trade', '물물교환'),
  consume('consume', '소모품'),
  food('food', '음식'),
  material('material', '재료'),
  cert('cert', '마물퇴치증표'),
  event('event', '이벤트'),
  dailySale('dailySale', '매일특가'),
  glasses('glasses', '안경상자'),
  cashDeca('cashDeca', '캐시샵-데카'),
  cashGold('cashGold', '캐시샵-골드'),
  undefined('undefined', '');

  const SellType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory SellType.fromCode(String code) {
    return SellType.values.firstWhere(
      (type) => type.code == code,
      orElse: () => SellType.undefined,
    );
  }
}

enum ResetCycle {
  daily('daily', '매일 6시'),
  weekly('weekly', '매주 월요일 6시'),
  monthly('monthly', '매달'),
  account('account', '계정당 1회'),
  character('character', '캐릭터당 1회'),
  noLimit('noLimit', '제한없음'),
  onEvent('onEvent', '이벤트 활성'),
  onEventEnd('onEventEnd', '이벤트 종료'),
  undefined('undefined', '');

  const ResetCycle(this.code, this.displayName);
  final String code;
  final String displayName;

  factory ResetCycle.fromCode(String code) {
    return ResetCycle.values.firstWhere(
      (type) => type.code == code,
      orElse: () => ResetCycle.undefined,
    );
  }
}

enum Region {
  tirconail('tirconail', '티르코네일'),
  colhen('colhen', '콜헨'),
  dunbaton('dunbaton', '던바튼'),
  dugaldhail('dugaldhail', '두갈드아일'),
  cashshop('cashshop', '캐시샵'),
  undefined('undefined', '');

  const Region(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Region.fromCode(String code) {
    return Region.values.firstWhere(
      (type) => type.code == code,
      orElse: () => Region.undefined,
    );
  }
}

class SellInfo {
  /*
    판매 물품 정보: Item, 판매NPC, 판매타입, 교환재화, 판매개수, 상점초기화주기, 구매계정제한여부, 판매지역
  */
  Item item;
  String npc;
  SellType sellType; // 판매 타입
  Item requiredItem; // 교환 재화, 개수
  int sellAmount; // 판매 개수
  ResetCycle resetCycle; // 상점 초기화 주기
  bool accountLimit; // 구매 계정 제한 여부
  Region region; // 판매 지역

  SellInfo({
    required this.item,
    required this.npc,
    required this.sellType,
    required this.requiredItem,
    required this.sellAmount,
    required this.resetCycle,
    required this.accountLimit,
    required this.region,
  });
}

class ToBuy {
  /*
    구매 물품 정보: SellInfo, 구매 희망
  */
  SellInfo item;
  bool toBuy; // 구매 희망
  int boughtCount = 0; // 구매한 갯수
  String? buyer; // 구매한 캐릭터 공용 아이템 구매시 확인용
  ToBuy({required this.item, this.toBuy = false});
}

enum Difficulty { 
  normal('normal', '일반'),
  hard('hard', '어려움'),
  veryHard('extreme', '매우 어려움'),
  undefined('undefined', '');

  const Difficulty(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Difficulty.fromCode(String code) {
    return Difficulty.values.firstWhere(
      (type) => type.code == code,
      orElse: () => Difficulty.undefined,
    );
  }
}

class Mission {
  String title;
  int totalCount;
  Difficulty difficulty = Difficulty.normal; // 난이도
  bool completeTimeAttack = false; // 타임어택 완료 여부
  ResetCycle resetCycle = ResetCycle.daily; // 초기화 주기
  bool accountLimit = false; // 계정 제한 여부
  Mission({
    required this.title,
    required this.totalCount,
    this.difficulty = Difficulty.normal,
    this.resetCycle = ResetCycle.daily,
    this.completeTimeAttack = true,
    this.accountLimit = false,
  });
  void setCompleteTimeAttack(bool value) {
    completeTimeAttack = value;
  }
}

class Todo {
  Mission mission;
  int completedCount; // 완료된 횟수
  bool isCompleted = false; // 완료 여부

  Todo({
    required this.mission,
    this.completedCount = 0,
    this.isCompleted = false,
  });

  void increment() {
    if (completedCount < mission.totalCount) {
      completedCount++;
      if (completedCount == mission.totalCount) {
        isCompleted = true;
      }
    }
  }

  void decrement() {
    if (completedCount > 0) {
      completedCount--;
      if (completedCount < mission.totalCount) {
        isCompleted = false;
      }
    }
  }
}

enum EquipParts {
  weapon('weapon', '무기'),
  head('head', '모자'),
  upperBody('upperBody', '상의'),
  lowerBody('lowerBody', '하의'),
  hands('hands', '장갑'),
  shoes('shoes', '신발'),
  ring('ring', '반지'),
  necklace('necklace', '목걸이'),
  undefined('undefined', '');

  const EquipParts(this.code, this.displayName);
  final String code;
  final String displayName;

  factory EquipParts.fromCode(String code) {
    return EquipParts.values.firstWhere(
      (type) => type.code == code,
      orElse: () => EquipParts.undefined,
    );
  }
}

class Equip {
  EquipParts equipParts;
  int level;
  int minPower;
  int maxPower;
  Equip({
    required this.equipParts,
    this.level = 0,
    this.minPower = 0,
    this.maxPower = 0,
  });
}

List<Equip> initalEquips() {
  return [
    Equip(
      equipParts: EquipParts.weapon,
      level: 40,
      minPower: 652,
      maxPower: 773,
    ),
    Equip(equipParts: EquipParts.head, level: 40, minPower: 167, maxPower: 198),
    Equip(
      equipParts: EquipParts.upperBody,
      level: 40,
      minPower: 167,
      maxPower: 198,
    ),
    Equip(
      equipParts: EquipParts.lowerBody,
      level: 40,
      minPower: 167,
      maxPower: 198,
    ),
    Equip(
      equipParts: EquipParts.hands,
      level: 40,
      minPower: 167,
      maxPower: 198,
    ),
    Equip(
      equipParts: EquipParts.shoes,
      level: 40,
      minPower: 167,
      maxPower: 198,
    ),
    Equip(equipParts: EquipParts.ring, level: 40, minPower: 88, maxPower: 104),
    Equip(
      equipParts: EquipParts.necklace,
      level: 40,
      minPower: 98,
      maxPower: 116,
    ),
    Equip(
      equipParts: EquipParts.weapon,
      level: 50,
      minPower: 919,
      maxPower: 1065,
    ),
    Equip(equipParts: EquipParts.head, level: 50, minPower: 236, maxPower: 273),
    Equip(equipParts: EquipParts.upperBody, level: 50, minPower: 236, maxPower: 273),
    Equip(equipParts: EquipParts.lowerBody, level: 50, minPower: 236, maxPower: 273),
    Equip(equipParts: EquipParts.shoes, level: 50, minPower: 236, maxPower: 273),
    Equip(equipParts: EquipParts.hands, level: 50, minPower: 236, maxPower: 273),
    Equip(equipParts: EquipParts.ring, level: 50, minPower: 124, maxPower: 144),
    Equip(equipParts: EquipParts.necklace, level: 50, minPower: 138, maxPower: 160),
    Equip(equipParts: EquipParts.weapon, level: 55, minPower: 1065, maxPower: 1260),
    Equip(equipParts: EquipParts.necklace, level: 55, minPower: 160, maxPower: 189),
    Equip(equipParts: EquipParts.ring, level: 55, minPower: 144, maxPower: 170),
    Equip(equipParts: EquipParts.head, level: 55, minPower: 273, maxPower: 323),
    Equip(equipParts: EquipParts.upperBody, level: 55, minPower: 273, maxPower: 323),
    Equip(equipParts: EquipParts.lowerBody, level: 55, minPower: 273, maxPower: 323),
    Equip(equipParts: EquipParts.shoes, level: 55, minPower: 273, maxPower: 323),    
    Equip(equipParts: EquipParts.hands, level: 55, minPower: 273, maxPower: 323),
    Equip(equipParts: EquipParts.weapon, level: 60, minPower: 1260, maxPower: 1454),
    Equip(equipParts: EquipParts.necklace, level: 60, minPower: 189, maxPower: 219),
    Equip(equipParts: EquipParts.ring, level: 60, minPower: 170, maxPower: 196),
    Equip(equipParts: EquipParts.head, level: 60, minPower: 323, maxPower: 373),
    Equip(equipParts: EquipParts.upperBody, level: 60, minPower: 323, maxPower: 373),
    Equip(equipParts: EquipParts.lowerBody, level: 60, minPower: 323, maxPower: 373),
    Equip(equipParts: EquipParts.shoes, level: 60, minPower: 323, maxPower: 373),    
    Equip(equipParts: EquipParts.hands, level: 60, minPower: 323, maxPower: 373),
    
    Equip(equipParts: EquipParts.weapon, level: 65, minPower: 1454, maxPower: 1697),
    Equip(equipParts: EquipParts.necklace, level: 65, minPower: 219, maxPower: 255),
    Equip(equipParts: EquipParts.ring, level: 65, minPower: 196, maxPower: 229),
    Equip(equipParts: EquipParts.head, level: 65, minPower: 373, maxPower: 435),
    Equip(equipParts: EquipParts.upperBody, level: 65, minPower: 373, maxPower: 435),
    Equip(equipParts: EquipParts.lowerBody, level: 65, minPower: 373, maxPower: 435),
    Equip(equipParts: EquipParts.shoes, level: 65, minPower: 373, maxPower: 435),    
    Equip(equipParts: EquipParts.hands, level: 65, minPower: 373, maxPower: 435),
    
    Equip(equipParts: EquipParts.weapon, level: 66, minPower: 1697, maxPower: 1940),
    Equip(equipParts: EquipParts.necklace, level: 66, minPower: 255, maxPower: 292),
    Equip(equipParts: EquipParts.ring, level: 66, minPower: 229, maxPower: 262),
    Equip(equipParts: EquipParts.head, level: 66, minPower: 435, maxPower: 498),
    Equip(equipParts: EquipParts.upperBody, level: 66, minPower: 435, maxPower: 498),
    Equip(equipParts: EquipParts.lowerBody, level: 66, minPower: 435, maxPower: 498),
    Equip(equipParts: EquipParts.shoes, level: 66, minPower: 435, maxPower: 498),    
    Equip(equipParts: EquipParts.hands, level: 66, minPower: 435, maxPower: 498),
    
  ];
}

class EquipAcheivement {
  Equip equip;
  int foundPower = 0;
  bool isCompleted = false; // 완료 여부
  EquipAcheivement({required this.equip});
  void setFoundPower(int power) {
    foundPower = power;
    if (foundPower == equip.maxPower) {
      isCompleted = true;
    } else {
      isCompleted = false;
    }
  }
  void setCompleted(){
    if(isCompleted){
      foundPower = equip.maxPower;
    } else {
      foundPower = equip.minPower;
    }
  }
}
List<EquipAcheivement> initialEquipAcheivement() {
  List<Equip> equips = initalEquips();
  List<EquipAcheivement> equipAcheivements = equips.map((equip) {
    return EquipAcheivement(equip: equip);
  }).toList();
  return equipAcheivements;
}

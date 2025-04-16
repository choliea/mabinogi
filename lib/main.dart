import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_model.dart';
import 'screens/todo_screen.dart';
import 'screens/buy_screen.dart';
import 'screens/cook_screen.dart';
import 'screens/equip_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider(profiles)),
        ChangeNotifierProvider(create: (context) => CharacterProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '마비노기 라이프',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: '마비노기 라이프'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  Future<void> _loadProfiles() async {
    await Provider.of<CharacterProfileProvider>(
      context,
      listen: false,
    ).loadProfiles();
    setState(() {
      _currentScreen = TodoScreen();
    });
  }

  void _onItemTapped(int index) {
    final profileProvider = Provider.of<CharacterProfileProvider>(
      context,
      listen: false,
    );
    final profiles = profileProvider.profiles;
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentScreen = TodoScreen();
          break;
        case 1:
          _currentScreen = BuyScreen();
          break;
        case 2:
          _currentScreen = CookScreen();
          break;
        case 3:
          _currentScreen = EquipScreen();
          break;
      }
    });
  }

  IconData _getClassIcon(String className) {
    switch (className) {
      case '전사':
        return Icons.sports_martial_arts;
      case '마법사':
        return Icons.wb_incandescent;
      case '궁수':
        return Icons.arrow_forward;
      default:
        return Icons.person;
    }
  }

  void _showCharacterCreationPopup(BuildContext context) {
    String? selectedServer;
    String? selectedClass;
    String nickname = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create New Character'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Server'),
                      value: selectedServer,
                      items:
                          <String>[
                            '데이안',
                            '아이라',
                            '던컨',
                            '알리사',
                            '메이븐',
                            '라사',
                            '칼릭스',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedServer = newValue;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? 'Please select a server' : null,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Class'),
                      value: selectedClass,
                      items:
                          <String>[
                            '전사',
                            '대검전사',
                            '검술사',
                            '궁수',
                            '장궁병',
                            '석궁사수',
                            '마법사',
                            '화염술사',
                            '빙결술사',
                            '힐러',
                            '사제',
                            '수도사',
                            '음유시인',
                            '악사',
                            '댄서',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedClass = newValue;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? 'Please select a class' : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nickname'),
                      onChanged: (value) {
                        nickname = value;
                      },
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a nickname'
                                  : null,
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                if (selectedServer != null &&
                    selectedClass != null &&
                    nickname.isNotEmpty) {
                  final newProfile = CharacterProfile(
                    server: selectedServer!,
                    nickname: nickname,
                    className: selectedClass!,
                  );
                  Provider.of<CharacterProfileProvider>(
                    context,
                    listen: false,
                  ).saveProfile(newProfile);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<CharacterProfileProvider>(context);
    final profiles = profileProvider.profiles;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                '마비노기 라이프',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('Todo'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Buy'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Cook'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_martial_arts),
              title: const Text('Equip'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  profiles.length < 3 || profiles.isEmpty
                      ? profiles.length + 1
                      : profiles.length,
              itemBuilder: (context, index) {
                if (profiles.length < 3 || profiles.isEmpty) {
                  if (index == profiles.length) {
                    return Container(
                      width: 120,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            _showCharacterCreationPopup(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add_circle_rounded,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
                final profile = profiles[index];
                return GestureDetector(
                  onTap: () {
                    _showCharacterEditPopup(context, index);
                  },
                  child: Container(
                    width: 120,
                    child: Card(
                      child: Stack(
                        children: [
                          Positioned(
                            right: 5,
                            top: 5,
                            child: GestureDetector(
                              onTap: () {
                                profileProvider.deleteProfile(index);
                              },
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(_getClassIcon(profile.className), size: 40),
                              Text(
                                profile.nickname,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                profile.server,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: _currentScreen),
        ],
      ),
    );
  }

  void _showCharacterEditPopup(BuildContext context, int profileIndex) {
    final profileProvider = Provider.of<CharacterProfileProvider>(
      context,
      listen: false,
    );
    CharacterProfile profile = profileProvider.profiles[profileIndex];
    String? selectedServer = profile.server;
    String? selectedClass = profile.className;
    String nickname = profile.nickname;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Character'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Server'),
                      value: selectedServer,
                      items:
                          <String>[
                            '데이안',
                            '아이라',
                            '던컨',
                            '알리사',
                            '메이븐',
                            '라사',
                            '칼릭스',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedServer = newValue;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? 'Please select a server' : null,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Class'),
                      value: selectedClass,
                      items:
                          <String>[
                            '전사',
                            '대검전사',
                            '검술사',
                            '궁수',
                            '장궁병',
                            '석궁사수',
                            '마법사',
                            '화염술사',
                            '빙결술사',
                            '힐러',
                            '사제',
                            '수도사',
                            '음유시인',
                            '악사',
                            '댄서',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedClass = newValue;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? 'Please select a class' : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nickname'),
                      initialValue: nickname,
                      onChanged: (value) {
                        nickname = value;
                      },
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a nickname'
                                  : null,
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (selectedServer != null &&
                    selectedClass != null &&
                    nickname.isNotEmpty) {
                  final updatedProfile = CharacterProfile(
                    server: selectedServer!,
                    nickname: nickname,
                    className: selectedClass!,
                  );
                  profileProvider.updateProfile(profileIndex, updatedProfile);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

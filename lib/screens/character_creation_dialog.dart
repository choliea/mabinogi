import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:provider/provider.dart';

class CharacterCreationDialog extends StatefulWidget {
  @override
  _CharacterCreationDialogState createState() => _CharacterCreationDialogState();
}

class _CharacterCreationDialogState extends State<CharacterCreationDialog> {
  String? _server = Server.values.first.code;
  String? _className = ClassName.values.first.code;
  final _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('보유 캐릭터 저장'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nicknameController,
              decoration: const InputDecoration(labelText: '이름'),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: '서버'),
              value: _server,
              items: Server.values.map((Server server) {
                return DropdownMenuItem<String>(
                  value: server.code,
                  child: Text(server.displayName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _server = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: '직업'),
              value: _className,
              items: ClassName.values.map((ClassName className) {
                return DropdownMenuItem<String>(
                  value: className.code,
                  child: Text(className.displayName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _className = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('취소'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('저장'),
          onPressed: () {
            if (_server != null && _className != null) {
              String nickname = _nicknameController.text.trim();
              if(nickname.isEmpty) {
                // 이름: 캐릭터{존재하는 캐릭터의 수 + 1}
                nickname = '캐릭터${Provider.of<CharacterProvider>(context, listen: false).characterProfiles.length + 1}';
              }
              final newCharacter = CharacterProfile(
                server: _server!,
                nickname: nickname,
                className: _className!,
              );
              newCharacter.toBuyList = initialBuy();
              newCharacter.todoList = initialTodo();
              newCharacter.equipAcheivement = initialEquipAcheivement();

              Provider.of<CharacterProvider>(context, listen: false).addCharacter(newCharacter);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }
}
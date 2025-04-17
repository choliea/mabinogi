import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:mabinogi/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';

List<Widget> cardList(context){
    final characterProvider = Provider.of<CharacterProvider>(context);
    List<Widget> cards = [];
    for (var character in characterProvider.characterProfiles) {
      IconData? icon;
      if (character.className == ClassName.warrior.code ||
                    character.className == ClassName.greatSwordWarrior.code ||
                    character.className == ClassName.swordsman.code) {
                  icon = Icons.shield; 
                } else if (character.className == ClassName.magician.code ||
                    character.className == ClassName.fireSorcerer.code ||
                    character.className == ClassName.iceSorcerer.code) {
                  icon = Icons.whatshot; 
                } else if (character.className == ClassName.healer.code ||
                    character.className == ClassName.monk.code ||
                    character.className == ClassName.priest.code) {
                  icon = Icons.health_and_safety_outlined;
                } else if (character.className == ClassName.archer.code ||
                    character.className == ClassName.longBowman.code ||
                    character.className == ClassName.crossbowman.code) {
                  icon = Icons.arrow_upward; 
                } else if (character.className == ClassName.bard.code ||
                    character.className == ClassName.dancer.code ||
                    character.className == ClassName.bard2.code) {
                  icon = Icons.music_note;
                }
      Card card = Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: icon != null ? Icon(icon) : null,
                    title: Text(character.nickname ?? ''),
                    subtitle: Text('${Server.fromCode(character.server).displayName} - ${ClassName.fromCode(character.className).displayName}'),
                    onTap: () {
                      characterProvider.selectCharacter(character);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TodoListScreen()),
                      );
                    },
                  ),
                );
      cards.add(card);
    }
    return cards;
}
import 'package:flutter/material.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:provider/provider.dart';

class ToBuyListScreen extends StatelessWidget {
  const ToBuyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    final selectedCharacter = characterProvider.selectedCharacter;

    if (selectedCharacter == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('To Buy List')),
        body: const Center(child: Text('No character selected.')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('To Buy List')),
      body: ListView.builder(
        itemCount: selectedCharacter.toBuyList.length,
        itemBuilder: (context, index) {
          final toBuy = selectedCharacter.toBuyList[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toBuy.item.item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('NPC: ${toBuy.item.npc}'),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: toBuy.toBuy,
                    onChanged: (value) {
                      characterProvider.updateToBuy(selectedCharacter, toBuy, value!);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
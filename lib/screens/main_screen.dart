import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:mabinogi/screens/character_card.dart';
import 'package:mabinogi/screens/character_creation_dialog.dart';
import 'package:mabinogi/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final CardSwiperController cardSwiper = CardSwiperController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = cardList(context);
    final characterProvider = Provider.of<CharacterProvider>(context);
    final bool hasCharacters = characterProvider.characterProfiles.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('마비노기 헬퍼'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showCharacterCreationDialog(context);
            },
          ),
        ],
      ),
      body: characterProvider.characterProfiles.isEmpty
          ? const Center(child: Text('보유하신 캐릭터가 없습니다. 캐릭터 정보를 입력해주세요!'))
          : SafeArea(
              child: Column(
                children: [
                  Flexible(
                    child: hasCharacters
                        ? CardSwiper(
                            controller: cardSwiper,
                            cardsCount: cards.length,
                            onSwipe: _onSwipe,
                            onUndo: _onUndo,
                            numberOfCardsDisplayed:
                                cards.length >= 3 ? 3 : cards.length,
                            backCardOffset: const Offset(40, 40),
                            padding: const EdgeInsets.all(24.0),
                            cardBuilder: (
                              context,
                              index,
                              horizontalThresholdPercentage,
                              verticalThresholdPercentage,
                            ) =>
                                cards[index],
                          )
                        : const SizedBox
                            .shrink(), // Or any other placeholder widget
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: cardSwiper.undo,
                          child: const Icon(Icons.rotate_left),
                        ),
                        FloatingActionButton(
                          onPressed: () =>
                              cardSwiper.swipe(CardSwiperDirection.left),
                          child: const Icon(Icons.keyboard_arrow_left),
                        ),
                        FloatingActionButton(
                          onPressed: () =>
                              cardSwiper.swipe(CardSwiperDirection.right),
                          child: const Icon(Icons.keyboard_arrow_right),
                        ),
                        FloatingActionButton(
                          onPressed: () =>
                              cardSwiper.swipe(CardSwiperDirection.top),
                          child: const Icon(Icons.keyboard_arrow_up),
                        ),
                        FloatingActionButton(
                          onPressed: () =>
                              cardSwiper.swipe(CardSwiperDirection.bottom),
                          child: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _showCharacterCreationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CharacterCreationDialog(),
    );
  }
  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
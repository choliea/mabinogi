import 'package:flutter/material.dart';
import 'package:mabinogi/model/model.dart';
import 'package:mabinogi/providers/character_provider.dart';
import 'package:mabinogi/screens/main_screen.dart';
import 'package:provider/provider.dart';

Widget ToBuySection(CharacterProfile? selectedCharacter) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       ExpansionTile(
         title: const Text('캐시샵'),
         children: [
           if (selectedCharacter != null)
             ToBuyList(
               characterProfile: selectedCharacter,
               toBuyItems: selectedCharacter.cashShop,
             ),
         ],
       ),
       ExpansionTile(
         title: const Text('티르코네일'),
         backgroundColor: Colors.grey[200],
         children: [
           if (selectedCharacter != null)
             ToBuyList(
               characterProfile: selectedCharacter,
               toBuyItems: selectedCharacter.tirconail,
             ),
         ],
       ),
       ExpansionTile(
         title: const Text('두갈드아일'),
         children: [
           if (selectedCharacter != null)
             ToBuyList(
               characterProfile: selectedCharacter,
               toBuyItems: selectedCharacter.dugaldhail,
             ),
         ],
       ),
       ExpansionTile(
         title: const Text('던바튼'),
         children: [
           if (selectedCharacter != null)
             ToBuyList(
               characterProfile: selectedCharacter,
               toBuyItems: selectedCharacter.dunbaton,
             ),
         ],
       ),
       ExpansionTile(
         title: const Text('콜헨'),
         children: [
           if (selectedCharacter != null)
             ToBuyList(
               characterProfile: selectedCharacter,
               toBuyItems: selectedCharacter.colhen,
             ),
         ],
       ),
     ],
   );
 }
class ToBuyList extends StatefulWidget {
   final CharacterProfile characterProfile;
   final List<ToBuy> toBuyItems;

   const ToBuyList({Key? key, required this.characterProfile, required this.toBuyItems}) : super(key: key);

   @override
   _ToBuyListState createState() => _ToBuyListState();
 }

 class _ToBuyListState extends State<ToBuyList> {
   bool _showAllItems = false;

   @override
   Widget build(BuildContext context) {
     // Use the injected list directly
     List<ToBuy> displayedItems = _showAllItems
         ? widget.toBuyItems
         : widget.toBuyItems.where((item) => item.toBuy).toList();

     return Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             TextButton(
               onPressed: () {
                 setState(() {
                   _showAllItems = !_showAllItems;
                 });
               },
               child: Text(_showAllItems ? 'Hide Unselected' : 'Show All'),
             ),
           ],
         ),
         ListView.builder(
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           itemCount: displayedItems.length,
           itemBuilder: (context, index) {
             final toBuy = displayedItems[index];
             return Card(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Checkbox(
                       value: toBuy.toBuy,
                       onChanged: (newValue) {
                         // Update toBuy status in CharacterProfile's specific list
                         setState(() {
                           toBuy.toBuy = newValue!; // Correctly update the local toBuy value

                           // Find the list the item belongs to
                           List<ToBuy> targetList;
                           if (widget.characterProfile.cashShop.contains(toBuy)) {
                             targetList = widget.characterProfile.cashShop;
                           } else if (widget.characterProfile.tirconail.contains(toBuy)) {
                             targetList = widget.characterProfile.tirconail;
                           } else if (widget.characterProfile.dugaldhail.contains(toBuy)) {
                             targetList = widget.characterProfile.dugaldhail;
                           } else if (widget.characterProfile.dunbaton.contains(toBuy)) {
                             targetList = widget.characterProfile.dunbaton;
                           } else if (widget.characterProfile.colhen.contains(toBuy)) {
                             targetList = widget.characterProfile.colhen;
                           } else {
                             targetList = []; // Should not happen, but handle it
                           }

                           // Update the CharacterProfile's list (important!)
                           final indexInProfile = targetList.indexOf(toBuy);
                           if (indexInProfile != -1) {
                             targetList[indexInProfile].toBuy = newValue;
                           }
                         });
                       },
                     ),
                     Expanded(child: Text(toBuy.item.item.name)),
                     // Add more details here (resetCycle, accountLimit, etc.)
                   ],
                 ),
               ),
             );
           },
         ),
         //Summary
         ToBuySummary(characterProfile: widget.characterProfile),
       ],
     );
   }
 }

class ToBuySummary extends StatelessWidget {
  final CharacterProfile characterProfile;

  const ToBuySummary({Key? key, required this.characterProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aggregate all toBuy items
    List<ToBuy> allToBuyItems = [
      ...characterProfile.cashShop,
      ...characterProfile.tirconail,
      ...characterProfile.dugaldhail,
      ...characterProfile.dunbaton,
      ...characterProfile.colhen,
    ];

    // Filter only those that are selected to buy
    List<ToBuy> selectedToBuyItems = allToBuyItems.where((item) => item.toBuy).toList();

    // Calculate total cost of required items
    Map<String, int> requiredItems = {};
    for (var toBuy in selectedToBuyItems) {
      String itemName = toBuy.item.requiredItem.name;
      int itemAmount = toBuy.item.requiredItem.amount;
      requiredItems[itemName] = (requiredItems[itemName] ?? 0) + itemAmount;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Summary:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (requiredItems.isEmpty)
              Text("No items selected to buy.")
            else
              ...requiredItems.entries.map((entry) {
                return Text("${entry.key}: ${entry.value}");
              }).toList(),
          ],
        ),
      ),
    );
  }
}
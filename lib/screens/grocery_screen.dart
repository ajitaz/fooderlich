import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/grocery_manager.dart';
import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = context.read(groceryManager);

          manager.createNewItem();
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer(builder: (context, watch, child) {
      final groceryItems = watch(groceryManager).groceryItems;
      if (groceryItems.isNotEmpty) {
        return GroceryListScreen(manager: context.read(groceryManager));
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }
}

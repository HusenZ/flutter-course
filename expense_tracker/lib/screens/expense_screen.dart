import 'package:expense_tracker/sheets/new_expense_sheet.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              // open the modal bottom sheet
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (ctx) => const AddNewExpense());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                const Text("thsi is a card\nand this is wide space"),
                ElevatedButton(onPressed: () {}, child: Text("button")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

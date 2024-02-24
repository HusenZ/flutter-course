import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key});

  @override
  State<AddNewExpense> createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final TextEditingController _titleEditingContorller = TextEditingController();
  final TextEditingController _amountEditingController =
      TextEditingController();
  DateTime? _pickedDate;
  Category _selectedCat = Category.food;

  void _datePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(
      now.day,
      now.month,
      now.year - 1,
    );
    var pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _pickedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleEditingContorller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
              hintText: "Enter The Title of the Expense",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$",
                    hintText: "0.0",
                    label: Text("Amount"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _pickedDate == null
                        ? "NO date selected"
                        : DateFormat.yMd().format(_pickedDate!),
                  ),
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          DropdownButton(
            value: _selectedCat,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedCat = value;
              });
            },
          )
        ],
      ),
    );
  }
}
/*
1. expense ka titile
2. kitna karch amount
3. date 
4. category
*/
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/custom_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({required this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  var selectedCategory = '';

  void submitData() {
    final enteredAmount = double.parse(amountController.text);
    /* final category = CustomButton.category; */
    if (enteredAmount <= 0) {
      return;
    }
    widget.addTx(selectedCategory, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Enter Amount",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: themeColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: themeColor)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: themeColor)),
                      labelStyle: TextStyle(
                          fontSize: 25,
                          color: themeColor,
                          fontWeight: FontWeight.bold)),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    icon: "assets/bills.png",
                    category: "Bills",
                    onPressed: () {
                      selectedCategory = "Bills";
                    },
                  ),
                  CustomButton(
                    icon: "assets/food.png",
                    category: "Food",
                    onPressed: () {
                      selectedCategory = "Food";
                    },
                  ),
                  CustomButton(
                    icon: "assets/clothes.png",
                    category: "Clothes",
                    onPressed: () {
                      selectedCategory = "Clothes";
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    icon: "assets/transport.png",
                    category: "Transport",
                    onPressed: () {
                      selectedCategory = "Transport";
                    },
                  ),
                  CustomButton(
                    icon: "assets/fun.png",
                    category: "Fun",
                    onPressed: () {
                      selectedCategory = "Fun";
                    },
                  ),
                  CustomButton(
                    icon: "assets/other.png",
                    category: "Other",
                    onPressed: () {
                      selectedCategory = "Other";
                    },
                  )
                ],
              ),
              TextButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.teal, fontSize: 25),
                  ),
                  onPressed: submitData)
            ],
          ),
        ));
  }
}

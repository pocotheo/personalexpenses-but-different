import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';
import '../widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  num sum = 0;
  num budget = 300;
  num percentageOfAnimation = 0;
  num percentage = 0;

  void _addNewTransaction(category, amount) {
    sum += amount;
    percentageOfAnimation = (sum / budget) * 100;
    percentage = ((sum / budget) * 100).toInt();
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: category,
        amount: amount,
        icon: 'assets/${category.toLowerCase()}.png',
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addTx: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: themeColor,
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Animation1(
              x: percentageOfAnimation,
              percentage: percentage,
            ),
            /* Container(
              child: Text(
                'Transactions',
                style: TextStyle(
                    color: fontColor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              padding: EdgeInsets.all(10),
            ), */
            TransactionList(transactions: _userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {_startAddNewTransaction(context)},
        backgroundColor: themeColor,
      ),
    );
  }
}

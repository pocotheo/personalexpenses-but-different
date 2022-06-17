import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../constants.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage(transactions[index].icon),
                  width: 40,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              transactions[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '${transactions[index].amount} £',
                              style: TextStyle(
                                  color: fontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                    elevation: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

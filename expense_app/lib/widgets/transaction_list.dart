import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  final List<Transaction> transactions;
  final Function(String id) deleteTx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? TextButton.icon(
                            icon: const Icon(Icons.delete),
                            label: const Text('Delete'),
                            onPressed: () => deleteTx(transactions[index].id),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                Theme.of(context).errorColor,
                              ),
                            ),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

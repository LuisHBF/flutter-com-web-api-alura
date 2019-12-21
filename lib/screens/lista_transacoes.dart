import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class ListaTransacoes extends StatelessWidget {
  final List<Transaction> transacoes = List();

  @override
  Widget build(BuildContext context) {
    transacoes.add(Transaction(100.0, Contact(0, 'Luis', 2414)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transaction transaction = transacoes[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contact.accountNumber.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transacoes.length,
      ),
    );
  }
}


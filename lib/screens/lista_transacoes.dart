import 'package:bytebank/models/contato.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:flutter/material.dart';

class ListaTransacoes extends StatelessWidget {
  final List<Transacao> transacoes = List();

  @override
  Widget build(BuildContext context) {
    transacoes.add(Transacao(100.0, Contato(0, 'Luis', 2414)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transacao transaction = transacoes[index];
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
                transaction.contato.numero.toString(),
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


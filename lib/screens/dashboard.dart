import 'package:bytebank/screens/lista_contatos.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _BotaoRecurso('Transferir', Icons.monetization_on,
                    callbackClique: () {
                  _redirecionarListaDeContatos(context);
                }),
                _BotaoRecurso(
                  'Transferências',
                  Icons.description,
                  callbackClique: () {
                    debugPrint("cliquei no icone de transferências");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _redirecionarListaDeContatos(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListaContatos()));
  }
}

class _BotaoRecurso extends StatelessWidget {
  final String _nome;
  final IconData _icone;
  final Function callbackClique;

  _BotaoRecurso(this._nome, this._icone, {@required this.callbackClique});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 3, color: Colors.black),
            left: BorderSide(width: 3, color: Colors.black),
            right: BorderSide(width: 3, color: Colors.black),
            bottom: BorderSide(width: 3, color: Colors.black),
          ),
        ),
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: () => callbackClique(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        _icone,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        _nome,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

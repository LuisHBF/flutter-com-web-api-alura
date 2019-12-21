import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDAO{

  static const String sqlTabela = 'CREATE TABLE $_nomeTabela('
      ' $_id INTEGER PRIMARY KEY, '
      ' $_nome TEXT,'
      ' $_numeroConta INTEGER)';

  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  Future<int> salvar(Contact contato) async {
    final Database bd = await criarBanco(ContatoDAO.sqlTabela);
    Map<String, dynamic> mapContato = _toMap(contato);
    return bd.insert(_nomeTabela, mapContato);
  }

  Future<List<Contact>> todos() async{
    final Database bd = await criarBanco(ContatoDAO.sqlTabela);
    final List<Map<String,dynamic>> resultado = await bd.query(_nomeTabela);
    List<Contact> contatos = _toList(resultado);
    return contatos;
  }

  List<Contact> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contact> contatos = List();
    resultado.forEach((map) {
      contatos.add(Contact(map[_id], map[_nome], map[_numeroConta]));
    });
    return contatos;
  }

  Map<String, dynamic> _toMap(Contact contato) {
    Map<String, dynamic> mapContato = Map();
    mapContato[_nome] = contato.name;
    mapContato[_numeroConta] = contato.numero;
    return mapContato;
  }


}
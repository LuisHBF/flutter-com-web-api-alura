import 'package:http/http.dart';

void todasTransacoes() async{
  final Response resposta = await get('http://192.168.0.103:8080/transactions');
  print(resposta.body);
}
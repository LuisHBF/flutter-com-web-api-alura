class Contact{
  final String name;
  final int numero;
  final int id;

  Contact(this.id, this.name, this.numero);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $name, numero: $numero}';
  }


}
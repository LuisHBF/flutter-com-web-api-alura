class Contact{
  final String name;
  final int accountNumber;
  final int id;

  Contact(this.id, this.name, this.accountNumber);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $name, numero: $accountNumber}';
  }


}
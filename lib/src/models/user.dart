import 'dart:convert';

class User {
  late int id;
  late String name;
  late String email;
  late String avaliacao;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avaliacao
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        id: map['id'] as int,
        name: map['name'] as String,
        email: map['email'] as String,
        avaliacao: map['passageiro']['avaliacao'] as String);
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User {
  final String username;

  User(this.username);
}

class UserProvider with ChangeNotifier {
  final List<User> _users = [User('Kaique'), User('Maria'), User('João')];
  User? _selectedUser;

  List<User> get users => _users;

  User? get selectedUser => _selectedUser;

  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }
}

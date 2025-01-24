import 'package:flutter/material.dart';


import '../model/data/photo.dart';

class AuthController extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<User?> fetch() async {
    _user= await AuthRepository().getUser();
    notifyListeners();
  }

  login(User user) async {
    _user= await AuthRepository().save(user);
    notifyListeners();
  }
  logout(User user) async {
    _user= await AuthRepository().delete();
    notifyListeners();
  }
  
  AuthRepository() {}
}
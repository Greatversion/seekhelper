import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seekhelperpro/models/userModel.dart';
import 'package:seekhelperpro/services/app.services.dart';


class UserViewModel extends ChangeNotifier {
  List<UserModel> _users = [];
  bool _loading = false;
  String _error = '';

  List<UserModel> get users => _users;
  bool get loading => _loading;
  String get error => _error;
bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _users = await ApiService.fetchUsers();
    } on SocketException {
      _error = 'No internet connection. Please check your network.';
      _users = [];
    } catch (e) {
      _error = 'Failed to load users: ${e.toString()}';
      _users = [];
    }

    _isLoading = false;
    notifyListeners();
  }

 void addUser(UserModel user) {
  _users.insert(0, user); // Adds at the top instead of end
  notifyListeners();
}


  List<UserModel> search(String query) {
    return _users.where((u) => u.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

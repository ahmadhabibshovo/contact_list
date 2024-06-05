import 'package:flutter/material.dart';

import '../entities/contact.dart';
class MyState with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContacts(Contact contact) {
    _contacts=[..._contacts,contact];
    notifyListeners(); // Notify listeners about the state change
  }
  void removeContacts(Contact contact) {
    _contacts=_contacts.where((c){return c!=contact;}).toList();
    notifyListeners(); // Notify listeners about the state change
  }
}

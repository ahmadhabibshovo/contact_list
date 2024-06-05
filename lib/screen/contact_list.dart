import 'package:contact_list/widgets/add_contact.dart';
import 'package:contact_list/widgets/display_contacts.dart';
import 'package:flutter/material.dart';




class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Contact List',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,0,8,8),
        child: Column(
          children: [
            Container(color: Colors.white,child:  AddContact(),),
            const DisplayContacts()
          ],
        ),
      ),
    );
  }
}




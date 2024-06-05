import 'package:contact_list/data/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entities/contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({
    super.key,
  });

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey= GlobalKey<FormState>();

  String name = '';

  String number = '';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MyState>(context, listen: true);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value){
                name =value!;
              },
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Please Enter Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black), // Border color
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Border radius
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (value){
              number =value!;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please Enter Number';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Number',
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black), // Border color
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // Border radius
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                state.addContacts(Contact(name: name, number: number));


              }
            }, child: const Text('Add')),
          )
        ],
      ),
    );
  }
}

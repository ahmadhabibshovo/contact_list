import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/contact_list.dart';

class DisplayContacts extends StatefulWidget {
  const DisplayContacts({super.key});

  @override
  State<DisplayContacts> createState() => _DisplayContactsState();
}

class _DisplayContactsState extends State<DisplayContacts> {

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MyState>(context, listen: true);
    return Expanded(child: ListView.separated(
      separatorBuilder: (_, __) {
        return const SizedBox(
          height: 5,
        );
      },
      itemBuilder: (context, index) {
        return InkWell(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),),
                    title: const Text(
                      'Confirmation',
                    ),
                    content: const Text('Are you sure for Delete?'),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.no_sim_outlined)),
                          IconButton(onPressed: () {
                            state.removeContacts(state.contacts[index]);
                            setState(() {

                            });
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.delete))
                        ],
                      )
                    ],
                  );
                });
          },
          child: ListTile(
            tileColor: Colors.grey.shade400,
            leading: const Icon(
              Icons.person,
              color: Colors.brown,
              size: 40,
            ),
            title: Text(
              state.contacts[index].name,
              style: const TextStyle(color: Colors.red),
            ),
            subtitle: Text(state.contacts[index].number),
            trailing: const Icon(
              Icons.phone,
              color: Colors.blue,
            ),
          ),
        );
      },
      itemCount: state.contacts.length,
      shrinkWrap: true,
    ));
  }
}

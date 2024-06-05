import 'package:contact_list/screen/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/contact_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => MyState()),
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.blue),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff667C89),
            foregroundColor: Colors.white,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              // Adjust the radius as needed
            ),

          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff667C89),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ContactList(),
    ),);
  }
}

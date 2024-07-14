import 'package:flutter/material.dart';
import 'method_selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESTful API Demo',
      home: MethodSelectionPage(),
    );
  }
}

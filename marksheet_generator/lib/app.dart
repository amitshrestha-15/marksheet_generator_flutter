import 'package:flutter/material.dart';
import 'package:marksheet_generator/view/marksheet_generator_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marksheet Generator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MarksheetGeneratorView(key: Key('marksheetGeneratorView')),
    );
  }
}

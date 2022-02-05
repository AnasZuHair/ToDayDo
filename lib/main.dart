import 'package:flutter/material.dart';
import 'package:notse_app/models/task_data.dart';
import 'package:notse_app/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDayDo',
        home: TaskScreen(),
      ),
    );
  }
}

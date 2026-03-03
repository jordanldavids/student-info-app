import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/student_viewmodel.dart';
import 'views/student_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // This creates the ViewModel ONCE and provides it to all children
      create: (_) => StudentViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Info App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        home: const StudentView(), // The screen that shows the UI
      ),
    );
  }
}
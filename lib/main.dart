import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ========== STATE VARIABLES ==========
  String studentName = "Mpho";
  String favoriteSubject = "TPG316C";
  int subjectIndex = 0;
  int studentAge = 20;
  List<String> subjects = ["TPG316C", "SOD316C", "PRG316C", "DCT316C"];
  // ========== FUNCTION TO INCREASE AGE ==========
  void increaseAge() {
    setState(() {
      studentAge++;
    });
  }

  // ========== BUILD METHOD ==========
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Student Card"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ========== STUDENT INFO CARD ==========
                // THIS IS THE CODE WE WILL EXTRACT (20+ lines)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Student Name: $studentName",
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Age: $studentAge",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Favorite Subject: $favoriteSubject",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                // ========== END OF CODE TO EXTRACT ==========
                const SizedBox(height: 30),
                // ========== CHANGE SUBJECT BUTTON ==========
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subjectIndex = (subjectIndex + 1) % subjects.length;
                        favoriteSubject = subjects[subjectIndex];
                      });
                    },
                    child: const Text(
                      "Change Subject",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // ========== BIRTHDAY BUTTON ==========
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: increaseAge,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      "Happy Birthday! 🎂🎂",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// STATELESS WIDGET - Like a printed photo
class PrintedPhoto extends StatelessWidget {
  // These values are FINAL - they cannot change
  final String personName;
  final String dateTaken;
  const PrintedPhoto({
    super.key,
    required this.personName,
    required this.dateTaken,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Person: $personName"), Text("Date: $dateTaken")],
    );
  }
}
// This widget will ALWAYS show the same person and date
// Like a physical photo - you can't change it after printing

class Whiteboard extends StatefulWidget {
  const Whiteboard({super.key});
  @override
  State<Whiteboard> createState() => _WhiteboardState();
}

class _WhiteboardState extends State<Whiteboard> {
  // STATE VARIABLES - These CAN change
  String message = "Hello"; // Can be erased and rewritten
  int counter = 0; // Can increase
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        Text("Count: $counter"),
        ElevatedButton(
          onPressed: () {
            // When button pressed, we CHANGE the state
            setState(() {
              message = "World";
              counter++;
            });
          },
          child: const Text("Change"),
        ),
      ],
    );
  }
}

// This widget can CHANGE - like a whiteboard
// The underscore (_) means "private" - only used in this file
class StudentInfoCard extends StatelessWidget {
  final String name;
  final String subject;
  final int age;
  const StudentInfoCard({
    super.key,
    required this.name,
    required this.subject,
    required this.age,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          Text("Student Name: $name", style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          Text(
            "Age: $age",
            style: const TextStyle(fontSize: 20, color: Colors.purple),
          ),
          const SizedBox(height: 10),
          Text(
            "Favorite Subject: $subject",
            style: const TextStyle(fontSize: 20, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'firebase_options.dart';
import 'movie_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase(); // Ensure Firebase is initialized
  runApp(MyApp());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase with options
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Filmes Assistidos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(230, 255, 255, 255),
      ),
      home: MovieListPage(),
    );
  }
}

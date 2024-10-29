import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa o Firebase Core
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart'; 
import 'firebase_options.dart'; // Certifique-se de que este arquivo está presente se você estiver usando Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Inicializa o Firebase
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(), // Definindo a HomePage como a tela inicial
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut(); 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: const Text(
          'Você logou!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

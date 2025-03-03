import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Contador(),
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int clickcontador = 0;

  void _incrementarContador() {
    setState(() {
      clickcontador++;
    });
  }

  void _decrementarContador() {
    setState(() {
      clickcontador--; // Ahora puede ir a valores negativos
    });
  }

  void _reiniciarContador() {
    setState(() {
      clickcontador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reiniciarContador,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cantidad de Clicks',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$clickcontador',
              style: const TextStyle(fontSize: 150, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementarContador,
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementarContador,
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}

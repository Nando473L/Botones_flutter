import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contador",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Fernando Cruz León",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10), // Espacio entre el nombre y el contador
            const Text(
              "Número de clicks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "$cont",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          _crearBotones(),
          _resetButton(),
        ],
      ),
    );
  }

  Widget _crearBotones() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _botonPersonalizado(Icons.remove, () => _restar(), Colors.purple),
          const SizedBox(width: 20), // Espacio entre botones
          _botonPersonalizado(Icons.add, () => _sumar(), Colors.purple),
        ],
      ),
    );
  }

  Widget _resetButton() {
    return Positioned(
      bottom: 0,
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => _reset(),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _botonPersonalizado(
      IconData icono, VoidCallback onPressed, Color color) {
    return FloatingActionButton(
      backgroundColor: color,
      onPressed: onPressed,
      child: Icon(icono),
    );
  }

  void _sumar() {
    setState(() {
      cont++;
    });
  }

  void _restar() {
    setState(() {
      if (cont > 0) {
        cont--;
      }
    });
  }

  void _reset() {
    setState(() {
      cont = 0;
    });
  }
}

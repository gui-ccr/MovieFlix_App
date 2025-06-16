import 'package:flutter/material.dart';

class DetalheFilmePage extends StatelessWidget {
  const DetalheFilmePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: const Center(
        child: Text('Esta e a tela de detalhes!'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DetalhePagina extends StatelessWidget {
  // 1. Declaramos uma variavel 'final' para guardar os dados do filme.
  // O tipo e' o mesmo que usamos na lista: um Mapa de String para dynamic.
  final Map<String, dynamic> filme;

  // 2. Criamos um construtor que RECEBE esses dados.
  // 'required this.filme' torna obrigatorio que, ao criar esta pagina,
  // os dados de um filme sejam fornecidos.
  const DetalhePagina({super.key, required this.filme});

  // Em lib/detalhe_filme_pagina.dart

  @override
  Widget build(BuildContext context) {
    // Montamos a URL completa do poster, assim como na tela anterior.
    final urlPoster = 'https://image.tmdb.org/t/p/w500${filme['poster_path']}';

    return Scaffold(
      appBar: AppBar(
        // Usamos o titulo do filme que recebemos para a barra de topo
        title: Text(filme['title']),
      ),
      // Usamos um SingleChildScrollView para permitir que a tela role
      // caso o conteudo seja muito grande para caber.
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem do poster no topo
            Image.network(urlPoster),

            // Padding para dar espacamento ao redor do texto
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // Alinha todo o texto a esquerda
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titulo do filme
                  Text(
                    filme['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10), // Espacamento
                  // Avaliacao
                  Text(
                    'Avaliacao: ${filme['vote_average']} ⭐',
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sinopse
                  const Text(
                    'Sinopse:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    filme['overview'], // A sinopse que veio da API
                    textAlign: TextAlign.justify, // Alinhamento justificado
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'detalhe_filme_pagina.dart';
void main() => runApp(const MovieFlixApp());

// Este e o widget raiz do nosso app
class MovieFlixApp extends StatelessWidget {
  const MovieFlixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieFlix',
      // Vamos usar um tema escuro que combina com apps de filmes
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      // A tela inicial do nosso app sera a HomePage
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Este e o widget da nossa tela principal
class _HomePageState extends State<HomePage> {
  // Comece direto com a declaracao das suas variaveis de estado!
  List<dynamic> _filmes = [];
  bool _carregando = true;

  Future<void> _buscarFilmesPopulares() async {
    // Sua chave de API do TMDB
    const apiKey = '6ceadc41cf0872e0a149f2cb4782846e'; 

    final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=pt-BR&page=1',
    );

    try {
      final resposta = await http.get(url);

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);
        // 'results' e a chave no JSON que contem a lista de filmes
        setState(() {
          _filmes = dados['results'];
          _carregando = false; // Terminamos de carregar
        });
      } else {
        // Se deu erro, paramos de carregar e mostramos o erro no console
        setState(() {
          _carregando = false;
        });
        print('Falha ao carregar filmes.');
      }
    } catch (e) {
      setState(() {
        _carregando = false;
      });
      print('Erro de conexao: $e');
    }

  }
    @override
    void initState() {
      super.initState(); // Esta linha e' obrigatoria
      _buscarFilmesPopulares(); // Chamamos nossa funcao aqui
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes Populares'),
        centerTitle: true, // Centraliza o titulo
      ),
      body:
          _carregando
              ? const Center(
                child: CircularProgressIndicator(),
              ) // Widget de "carregando"
              : GridView.builder(
                itemCount:
                    _filmes
                        .length, // O numero de itens agora vem da nossa lista
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // Pegamos os dados do filme atual na lista
                  final filme = _filmes[index];
                  // Montamos a URL completa do poster
                  final urlPoster =
                      'https://image.tmdb.org/t/p/w500${filme['poster_path']}';

                  // Em vez de um Container cinza, agora retornamos a imagem do poster!
                  return InkWell(
                    onTap: () {
  // Navigator.push e' o comando para ir para uma nova tela.
  Navigator.push(
    context, // O 'contexto' atual sabe onde estamos na arvore de widgets.
    MaterialPageRoute(
      // O 'builder' e' uma funcao que constroi a tela para a qual queremos ir.
      builder: (context) => DetalhePagina(filme: filme),
    ),
  );
},
                  child: Card(
                  elevation: 5,
                    child: ClipRRect(
                      // Para deixar a imagem com bordas arredondadas
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        urlPoster,
                        fit:
                            BoxFit
                                .cover, // Garante que a imagem cubra todo o espaco
                      ),
                    ),
                  )  
                  );
                },
              ),
    );
  }
}

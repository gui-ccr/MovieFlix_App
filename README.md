# 🎬 MovieFlix - Um Navegador de Filmes em Flutter

![Dart](https://img.shields.io/badge/Language-Dart-blue?logo=dart)
![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B?logo=flutter)
![License](https://img.shields.io/badge/License-MIT-green)

O MovieFlix é uma aplicação móvel desenvolvida em Flutter que funciona como um navegador de filmes, exibindo os filmes mais populares do momento e permitindo ao usuário visualizar detalhes sobre cada um. O projeto consome dados em tempo real da API do **The Movie Database (TMDB)**.

Este projeto foi criado como um estudo prático focado em conceitos essenciais do Flutter, como gerenciamento de estado, consumo de APIs, navegação entre telas e construção de interfaces de usuário dinâmicas.

---
## ✨ Funcionalidades

* ✅ **Grade de Filmes Populares:** A tela inicial exibe uma grade rolável com os pôsteres dos filmes mais populares atualmente.
* ✅ **Dados em Tempo Real:** As informações são buscadas dinamicamente da API da TMDB, garantindo que o conteúdo esteja sempre atualizado.
* ✅ **Navegação entre Telas:** Ao tocar em um pôster, o usuário navega para uma tela de detalhes específica para aquele filme.
* ✅ **Tela de Detalhes:** Apresenta informações detalhadas do filme selecionado, como título, pôster, avaliação e sinopse.
* ✅ **Interface Responsiva:** Exibe um indicador de carregamento (`loading`) enquanto os dados são buscados da internet.

---
## 🧠 Conceitos Aplicados

Este projeto foi uma oportunidade para aplicar na prática os seguintes conceitos do ecossistema Flutter/Dart:

* **StatefulWidget e Gerenciamento de Estado:** A tela principal é um `StatefulWidget` que gerencia o estado da aplicação (lista de filmes, status de carregamento). O método `setState()` é utilizado para reconstruir a interface quando novos dados chegam da API.

* **Layouts Dinâmicos com `GridView.builder`:** A grade de filmes é construída de forma eficiente com o `GridView.builder`, que cria os itens da lista sob demanda, garantindo alta performance mesmo com um grande número de filmes.

* **Consumo de API e Programação Assíncrona:**
    * **Pacote `http`:** Utilizado para fazer requisições HTTP GET à API da TMDB.
    * **`async / await`:** A função de busca de filmes é assíncrona, garantindo que a interface do usuário não trave enquanto espera pela resposta da rede.
    * **Manipulação de JSON:** A resposta da API (em formato JSON) é decodificada com `dart:convert` para um formato `Map` que o Dart pode manipular facilmente.

* **Navegação entre Telas (`Navigator`):**
    * O `Navigator.push` é utilizado para "empurrar" a nova tela de detalhes para a pilha de navegação.
    * O `MaterialPageRoute` é usado para definir a rota e construir a nova tela.

* **Passagem de Dados entre Telas:** Os dados do filme selecionado (o objeto `Map` do filme) são passados da tela principal para a tela de detalhes através do construtor do widget da nova tela.

* **Widgets Essenciais:** Uso extensivo de widgets fundamentais como `MaterialApp`, `Scaffold`, `AppBar`, `Card`, `Image.network` (para carregar imagens da internet), `Column`, `Icon` e `Text` com `TextStyle`.

---
## 🚀 Como Executar

### Pré-requisitos
* Ter o [SDK do Flutter](https://flutter.dev/docs/get-started/install) instalado.
* Um editor de código como VS Code ou Android Studio.
* Uma chave de API gratuita do [The Movie Database (TMDB)](https://www.themoviedb.org/signup).

### Passos
1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
    cd SEU_REPOSITORIO
    ```

2.  **Adicione a Chave de API:**
    * No arquivo `lib/main.dart` (ou onde você criou a `HomePage`), encontre a linha:
        `const apiKey = 'SUA_CHAVE_DE_API_AQUI';`
    * Substitua `'SUA_CHAVE_DE_API_AQUI'` pela sua chave real da TMDB.

3.  **Instale as dependências:**
    * Abra o arquivo `pubspec.yaml` e certifique-se de que o pacote `http` está listado em `dependencies`.
    * Rode o comando no terminal:
    ```bash
    flutter pub get
    ```

4.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```

---
## 📸 Screenshots

![GIF do App](/image/gif%20app.gif)

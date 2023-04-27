import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_g1/api_client.dart';
import 'package:trabalho_g1/confs/routes.dart';
import 'package:trabalho_g1/response_data.dart';

class ListClasses extends StatefulWidget {
  const ListClasses({super.key});

  @override
  State<ListClasses> createState() => _ListClassesState();
}

class _ListClassesState extends State<ListClasses> {
  var classes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick And Morty API"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SHOW_MAP);
            },
            icon: const Icon(Icons.map)
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final ResponseData? posts = snapshot.data;

          return posts == null
              ? const Text("Erro na requisição.")
              : _buildListView(context, posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListView(BuildContext context, ResponseData posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.network(
              posts.data[index]
                  ['image'], // Substitua pelo URL correto da sua imagem
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              posts.data[index]['name'],
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Specie: ${posts.data[index]['species']}'),
                Text(
                    'Gender: ${posts.data[index]['gender']}'), // Adiciona o campo "gender" como subtítulo
              ],
            ),
          ),
        );
      },
      itemCount: posts.data.length,
    );
  }
}
import 'package:flutter/material.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nome',
              //errorText: 'Informe o nome da aula',
              border: OutlineInputBorder(),
              /*suffixIcon: Icon(
                Icons.error,
              ),*/
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Local',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ]),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  ListsScreenState createState() => ListsScreenState();
}

class ListsScreenState extends State<ListsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> listNames = ['Vistas', 'Por ver', 'Favoritas', 'Acción'];

    return ListView.builder(
      itemCount: listNames.length,
      itemBuilder: (context, index) {
        String listName = listNames[index];

        return InkWell(
          onTap: () {
            // Lógica para manejar el clic en la lista
            // Aquí podrías navegar a la pantalla de películas de esa lista
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                listName,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:bookshelf_app/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> books = ['Choke'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[100],
        title: const Text('Список книг в библиотеке'),
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(Icons.add)
            )
        ],
      ),
      body: ListView(
        children: const [
          Divider(height: 10, color: Colors.transparent,),
          BookCard()
        ],
      ),
    );
  }
}
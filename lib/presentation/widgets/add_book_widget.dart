import 'dart:convert';
import 'package:bookshelf_app/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBookWidget extends StatelessWidget {
  AddBookWidget({super.key});
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  late Book newBook;
  late Future<XFile?> _pickedFile;
  late String base64Image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('Добавить книгу...', style: TextStyle(fontSize: 20),),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Введите название книги'
            ),
          ),
          const Divider(color: Colors.transparent, height: 8),
          TextField(
            controller: _authorController,
            decoration: const InputDecoration(
              hintText: 'Введите автора книги'
            ),
          ),
          const Divider(color: Colors.transparent, height: 8),
          GestureDetector(
            onTap: () async {
              _pickedFile = _imagePicker.pickImage(source: ImageSource.gallery);
              _pickedFile.then((XFile? file) async { 
                var imageBytes = await file!.readAsBytes();
                base64Image = base64Encode(imageBytes);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.cyan[100]
              ),
              child: const Text('Добавить обложку'),
            ),
          ),
          const Divider(color: Colors.transparent, height: 8),
          GestureDetector(
            onTap: () {
              newBook = Book(id: 0, name: _nameController.text, author: _authorController.text, image: base64Image, rate: '');
              
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.cyan[100]
              ),
              child: const Text("Добавить"),
            )
          )
        ],
      ),
    );
  }
}
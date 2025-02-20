import 'dart:convert';

import 'package:bookshelf_app/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel(
      {required super.id,
      required super.name,
      required super.author,
      required super.image,
      required super.rate});

  factory BookModel.fromRawJson(String str) {
    return BookModel.fromJson(json.decode(str));
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      image: json['image'],
      rate: json['rate'],
    );
  }

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "author": author,
        "image": image,
        "rate": rate,
      };
}

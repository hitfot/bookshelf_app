import 'package:bookshelf_app/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooksList();
  Future<void> addBook(Book book);
}
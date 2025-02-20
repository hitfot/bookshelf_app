import 'package:bookshelf_app/data/datasources/books_local.dart';
import 'package:bookshelf_app/data/models/book_model.dart';
import 'package:bookshelf_app/domain/entities/book.dart';
import 'package:bookshelf_app/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BooksLocal localDataSource;

  BookRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<List<Book>> getBooksList() async {
    final booksList = await localDataSource.getBooksList();
    return booksList;
  }

  @override
  Future<void> addBook(Book book) async {
    localDataSource.addBookToList(BookModel(
        id: book.id,
        name: book.name,
        author: book.author,
        image: book.image,
        rate: book.rate));
  }
}

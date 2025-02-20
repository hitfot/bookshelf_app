import 'package:bookshelf_app/data/models/book_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class BooksLocal {
  Future<List<BookModel>> getBooksList();
  Future<void> addBookToList(BookModel book);
}

class BooksLocalImpl implements BooksLocal {

  @override
  Future<List<BookModel>> getBooksList() async {
    final String databesesPath = await getDatabasesPath();
    final String path = '${databesesPath}bookshelf.db';

    Database db = await openDatabase(path,
    onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Books (id INTEGER PRIMARY KEY, name TEXT, author TEXT, image TEXT, rate TEXT)");
      await db.execute("INSERT INTO Books(id, name, author, image, rate) VALUES(1, Chuck Palahniuk, Choke, )");
    });

    List<Map<String, dynamic>> list = await db.rawQuery("SELECT * FROM Books");
    await db.close();
    List<BookModel> returnableList = [];
    for (var value in list) {returnableList.add(BookModel.fromJson(value));}
    return returnableList;
  }
  
  @override
  Future<void> addBookToList(BookModel book) async {
    final String databesesPath = await getDatabasesPath();
    final String path = '${databesesPath}bookshelf.db';

    Database db = await openDatabase(path,
      onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Books (id INTEGER PRIMARY KEY, name TEXT, author TEXT, image TEXT, rate TEXT)");
    });

    await db.execute("INSERT INTO Books(id, name, author, image, rate) VALUES(${book.name}, ${book.author}, ${book.image}, ${book.rate}");
    await db.close();
  }
}
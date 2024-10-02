import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper databaseHelper = DatabaseHelper._();

  Database? database;

  Future<void> initDataBase() async {
    String directoryPath = await getDatabasesPath();
    String path = join(directoryPath, 'ecom.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query = '''
        CREATE TABLE IF NOT EXISTS items (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          price TEXT NOT NULL
        );
        ''';
        await db.execute(query);
      },
    );
  }

  // Insert a new item into the database
  Future<int> insertItem({required String name, required String price}) async {
    if (database == null) {
      await initDataBase();
    }
    String query = '''
    INSERT INTO items (name, price)
    VALUES (?, ?)
    ''';
    List<dynamic> args = [name, price];

    int id = await database!.rawInsert(query, args);
    return id;
  }

  // Fetch all items from the database
  Future<List<Map<String, dynamic>>> fetchAllItems() async {
    if (database == null) {
      await initDataBase();
    }
    String query = "SELECT * FROM items;";

    List<Map<String, dynamic>> allRecords = await database!.rawQuery(query);
    return allRecords;
  }

  Future<int> updateItem(
      {required String name, required String price, required int id}) async {
    if (database == null) {
      await initDataBase();
    }

    String query = '''
    UPDATE items 
    SET name = ?, price = ? 
    WHERE id = ?;
    ''';
    List<dynamic> args = [name, price, id];

    int result = await database!.rawUpdate(query, args);
    return result;
  }

  Future<int> deleteItem({required int id}) async {
    if (database == null) {
      await initDataBase();
    }
    String query = "DELETE FROM items WHERE id = ?;";
    List<dynamic> args = [id];

    int res = await database!.rawDelete(query, args);
    return res;
  }

  Future<int> deleteAllItems() async {
    if (database == null) {
      await initDataBase();
    }
    String query = "DELETE FROM items;";

    int res = await database!.rawDelete(query);
    return res;
  }

  Future<List<Map<String, dynamic>>> searchItems(
      {required String searchTerm}) async {
    if (database == null) {
      await initDataBase();
    }

    String query = '''
    SELECT * FROM items 
    WHERE name LIKE ? OR price LIKE ?;
    ''';
    List<dynamic> args = ['%$searchTerm%', '%$searchTerm%'];

    List<Map<String, dynamic>> searchResults =
        await database!.rawQuery(query, args);
    return searchResults;
  }
}

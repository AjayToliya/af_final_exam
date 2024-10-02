// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class Data {
//   Data._();
//  static final Data data = Data._();
//
//   Database? database;
//   addItem({,required int price}) async {
//     String? pathOfData = await getDatabasesPath();
//     String path = join(pathOfData, "Ecom.DB");
//     database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       String query = """
//     CREATE TABLE IF NOT EXISTS item (id INTEGER PRIMARY KEY AUTOINCREMENT,
//     name TEXT NOT NULL,
//     price INTEGER NOT NULL)
//     """;
//       db.execute(query);
//     });
//   }
//
//   fetchAllData() {
//     String query = "";
//   }
//
//   Future<int> insertItem() async {
//     String query = "UPDATE item SET (name , price)VALUE (?,?)";
//     List args = ["ajay", "1"];
//     int id = await database!.rawInsert(query, args);
//     return id;
//   }
//
//   updateData() async {
//     String query = " INTO item(name , price)VALUE (?,?)";
//     List args = ["ajay", "1"];
//     int id = await database!.rawUpdate(query, args);
//     return id;
//   }
// }

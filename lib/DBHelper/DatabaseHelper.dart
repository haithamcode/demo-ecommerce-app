
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Define the table names and column names
  static final String tableUsers = 'users';
  static final String columnUserId = 'id';
  static final String columnUserName = 'name';
  static final String columnUserEmail = 'email';
  static final String columnUserPassword = 'password';
  static final String columnUserPhoneNumber = 'phone_number';

// jeans part
  static final String tableProducts = 'products';
  static final String columnProductId = 'id';
  static final String columnProductName = 'name';
  static final String columnProductDescription = 'description';
  static final String columnProductPrice = 'price';
  static final String columnProductImage = 'image';

  static final String tableTshirts = 'tshirts';
  static final String columnTshirtId = 'id';
  static final String columnTshirtName = 'name';
  static final String columnTshirtDescription = 'description';
  static final String columnTshirtPrice = 'price';
  static final String columnTshirtImage = 'image';

  static final String tableShoes = 'shoes';
  static final String columnShoeId = 'id';
  static final String columnShoeName = 'name';
  static final String columnShoeDescription = 'description';
  static final String columnShoePrice = 'price';
  static final String columnShoeImage = 'image';

  static final String tableCategories = 'category';
  static final String columnCategoryId = 'id';
  static final String columnCategoryName = 'name';
  static final String columnCategoryImage = 'image';

  static final String tableOrders = 'orders';
  static final String columnOrderId = 'id';
  static final String columnOrderUserId = 'user_id';
  static final String columnOrderProductId = 'product_id';
  static final String columnOrderQuantity = 'quantity';
  static final String columnOrderTotalPrice = 'total_price';

  // Define the SQL statements to create the tables
  static final String createTableUsers = '''
    CREATE TABLE $tableUsers (
      $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnUserName TEXT NOT NULL,
      $columnUserEmail TEXT NOT NULL UNIQUE,
      $columnUserPassword TEXT NOT NULL,
      $columnUserPhoneNumber TEXT NOT NULL
    )
  ''';

//jeans tbl
  static final String createTableProducts = '''
    CREATE TABLE $tableProducts (
      $columnProductId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnProductName TEXT NOT NULL,
      $columnProductDescription TEXT NOT NULL,
      $columnProductPrice REAL NOT NULL,
      $columnProductImage TEXT NOT NULL
    )
  ''';

  static final String createTableTshirts = '''
    CREATE TABLE $tableTshirts (
      $columnTshirtId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTshirtName TEXT NOT NULL,
      $columnTshirtDescription TEXT NOT NULL,
      $columnTshirtPrice REAL NOT NULL,
      $columnTshirtImage TEXT NOT NULL
    )
  ''';
  static final String createTableShoes = '''
    CREATE TABLE $tableShoes (
      $columnShoeId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnShoeName TEXT NOT NULL,
      $columnShoeDescription TEXT NOT NULL,
      $columnShoePrice REAL NOT NULL,
      $columnShoeImage TEXT NOT NULL
    )
  ''';

  static final String createTableCategories = '''
    CREATE TABLE $tableCategories (
      $columnCategoryId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnCategoryName TEXT NOT NULL,
      $columnTshirtImage TEXT NOT NULL
    )
  ''';

  static final String createTableOrders = '''
    CREATE TABLE $tableOrders (
      $columnOrderId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnOrderUserId INTEGER NOT NULL,
      $columnOrderProductId INTEGER NOT NULL,
      $columnOrderQuantity INTEGER NOT NULL,
      $columnOrderTotalPrice REAL NOT NULL,
      FOREIGN KEY ($columnOrderUserId) REFERENCES $tableUsers ($columnUserId),
      FOREIGN KEY ($columnOrderProductId) REFERENCES $tableProducts ($columnProductId)
    )
  ''';

  static Database? _database;

  // Create the database
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'hythamone.db');
    // final String path = join(dbPath, 'haithamf.db');
    // final String path = join(dbPath, 'haitham.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(createTableUsers);
        await db.execute(createTableProducts);//jeans tbl
        await db.execute(createTableOrders);
        await db.execute(createTableTshirts);
        await db.execute(createTableShoes);
        await db.execute(createTableCategories);
      },
    );
  }

  // Insert a new user into the database
  Future<int> insertUser(Map<String, dynamic> user) async {
    try {
      final Database db = await database;
      return await db.insert(tableUsers, user);
    } catch (e) {
      throw Exception('Failed to insert user: $e');
    }
  }

  // Get a user by their email address
  Future<Map<String, dynamic>> getUserByEmail(String email) async {
    var a ;
    try {
      final Database db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        tableUsers,
        where: '$columnUserEmail = ?',
        whereArgs: [email],
      );
      if (maps.length > 0) {
        return maps.first;
      }
      else{
        print(a);
        return a;}
    } catch (e) {
      throw Exception('Failed to get user by email: $e');
    }
  }

  // Insert a new jeans into the database
  Future<int> insertProduct(Map<String, dynamic> product) async {
    try {
      final Database db = await database;
      return await db.insert(tableProducts, product);
    } catch (e) {
      throw Exception('Failed to insert product: $e');
    }
  }

  Future<int> insertTshirt(Map<String, dynamic> tshirt) async {
    try {
      final Database db = await database;
      return await db.insert(tableTshirts, tshirt);
    } catch (e) {
      throw Exception('Failed to insert Tshirts: $e');
    }
  }

  Future<int> insertShoes(Map<String, dynamic> shoes) async {
    try {
      final Database db = await database;
      return await db.insert(tableShoes, shoes);
    } catch (e) {
      throw Exception('Failed to insert Shoes: $e');
    }
  }

  Future<int> insertCategory(Map<String, dynamic> Category) async {
    try {
      final Database db = await database;
      return await db.insert(tableCategories, Category);
    } catch (e) {
      throw Exception('Failed to insert Category: $e');
    }
  }

  // Get all jeans from the database
  Future<List<Map<String, dynamic>>> getProducts() async {
     await Future.delayed(Duration(seconds: 1));
    try {
      final Database db = await database;
      return await db.query(tableProducts);
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getTshirts() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final Database db = await database;
      return await db.query(tableTshirts);
    } catch (e) {
      throw Exception('Failed to get tshirts: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getShoes() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final Database db = await database;
      return await db.query(tableShoes);
    } catch (e) {
      throw Exception('Failed to get shoes: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final Database db = await database;
      return await db.query(tableCategories);
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }

  // Insert a new order into the database
  Future<int> insertOrder(Map<String, dynamic> order) async {
    try {
      final Database db = await database;
      return await db.insert(tableOrders, order);
    } catch (e) {
      throw Exception('Failed to insert order: $e');
    }
  }

  // Get all orders for a user from the database
  Future<List<Map<String, dynamic>>> getOrdersForUser(int userId) async {
    try {
      final Database db = await database;
      return await db.query(
        tableOrders,
        where: '$columnOrderUserId = ?',
        whereArgs: [userId],
      );
    } catch (e) {
      throw Exception('Failed to get orders for user: $e');
    }
  }
  Future<void> deleteItem(int itemId , String tbl) async {
    final Database db = await openDatabase('hythamone.db');
    await db.delete(
      tbl,
      where: 'id = ?',
      whereArgs: [itemId],
    );
  }
}
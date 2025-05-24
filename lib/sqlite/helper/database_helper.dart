import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/model_buku.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'db_buku');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //proses utk bikin table buku
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tb_buku (
      id INTEGER PRIMARY KEY,
      namaBuku TEXT,
      judulBuku TEXT
    )
    ''');
  }

  Future<int> insertBuku(ModelBuku buku) async {
    Database db = await instance.db;
    return await db.insert('tb_buku', buku.toMap());
  }

  //get semua data
  Future<List<Map<String, dynamic>>> queryAllBuku() async {
    Database db = await instance.db;
    return await db.query('tb_buku');
  }

  Future<int> updateBuku(ModelBuku buku) async {
    Database db = await instance.db;
    return await db.update(
      'tb_buku',
      buku.toMap(),
      where: 'id = ?',
      whereArgs: [buku.id],
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.db;
    return await db.delete('tb_buku', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> initializeDataBuku() async {
    List<ModelBuku> dataBukuToAdd = [
      ModelBuku(namaBuku: 'Komik', judulBuku: 'Hii Miko'),
      ModelBuku(namaBuku: 'Komik', judulBuku: 'Scrambled 1'),
      ModelBuku(namaBuku: 'Novel', judulBuku: 'Raden Ajeng Kartini'),
      ModelBuku(namaBuku: 'Psikolog', judulBuku: 'Untukmu Anak Bungsu'),
      ModelBuku(namaBuku: 'Novel', judulBuku: 'Hidup Ini Terlalu Banyak Kamu'),
    ];
    for (ModelBuku modelBuku in dataBukuToAdd) {
      await insertBuku(modelBuku);
    }
  }
}

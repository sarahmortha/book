// main.dart
import 'package:flutter/material.dart';
import 'book_list_screen.dart';
import 'book_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Book> books = []; // Initialize your list of books

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Collection App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BookListScreen(books: books), // Pass the list of books
    );
  }
}

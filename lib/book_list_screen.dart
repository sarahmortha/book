// book_list_screen.dart
import 'package:flutter/material.dart';
import 'add_book_screen.dart';
import 'book_model.dart';

class BookListScreen extends StatefulWidget {
  final List<Book> books;

  BookListScreen({required this.books});

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  late List<Book> filteredBooks;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBooks = List.from(widget.books);
  }

  void _filterBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBooks = List.from(widget.books);
      } else {
        filteredBooks = widget.books
            .where((book) =>
                book.title.toLowerCase().contains(query.toLowerCase()) ||
                book.author.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Collection'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterBooks,
              decoration: InputDecoration(
                labelText: 'Search for books',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredBooks[index].title),
                  subtitle: Text(filteredBooks[index].author),
                  onTap: () {
                    // Handle tap on book item if needed
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await Navigator.push<Book>(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookScreen(),
            ),
          );

          if (newBook != null) {
            setState(() {
              widget.books.add(newBook);
              filteredBooks = List.from(widget.books);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

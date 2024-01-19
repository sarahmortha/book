// add_book_screen.dart
import 'package:flutter/material.dart';
import 'book_model.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  BookStatus selectedStatus = BookStatus.JustPurchased;

  DateTime addedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: genreController,
              decoration: InputDecoration(labelText: 'Genre'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Publication Year'),
            ),
            TextField(
              controller: monthController,
              decoration: InputDecoration(labelText: 'Publication Month'),
            ),
            DropdownButtonFormField<BookStatus>(
              value: selectedStatus,
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
              items: BookStatus.values
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status.toString().split('.').last),
                      ))
                  .toList(),
              decoration: InputDecoration(labelText: 'Status'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    authorController.text.isNotEmpty &&
                    genreController.text.isNotEmpty &&
                    yearController.text.isNotEmpty &&
                    monthController.text.isNotEmpty) {
                  Book newBook = Book(
                    title: titleController.text,
                    author: authorController.text,
                    genre: genreController.text,
                    description: descriptionController.text,
                    publicationYear: int.tryParse(yearController.text) ?? 0,
                    publicationMonth: int.tryParse(monthController.text) ?? 0,
                    status: selectedStatus,
                    addedDate: addedDate,
                  );

                  Navigator.pop(context, newBook);
                } else {
                  // Handle case where required fields are empty
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('All fields are required.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}

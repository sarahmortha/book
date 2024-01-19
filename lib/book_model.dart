// book_model.dart
import 'package:flutter/foundation.dart';

enum BookStatus { JustPurchased, Read, InProgress, OnHold }

class Book {
  final String title;
  final String author;
  final String genre;
  final String description;
  final int publicationYear;
  final int publicationMonth;
  final BookStatus status;
  final DateTime addedDate; // Added this property

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.publicationYear,
    required this.publicationMonth,
    required this.status,
    required this.addedDate, // Initialize this property in the constructor
  });
}

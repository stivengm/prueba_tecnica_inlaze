import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
  String error;
  String total;
  List<Book> books;

  BooksModel({
    required this.error,
    required this.total,
    required this.books,
  });

  BooksModel copyWith({
    String? error,
    String? total,
    List<Book>? books,
  }) => BooksModel(
    error: error ?? this.error,
    total: total ?? this.total,
    books: books ?? this.books,
  );

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    error: json["error"],
    total: json["total"],
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "total": total,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Book {
  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  Book copyWith({
    String? title,
    String? subtitle,
    String? isbn13,
    String? price,
    String? image,
    String? url,
  }) => Book(
    title: title ?? this.title,
    subtitle: subtitle ?? this.subtitle,
    isbn13: isbn13 ?? this.isbn13,
    price: price ?? this.price,
    image: image ?? this.image,
    url: url ?? this.url,
  );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    title: json["title"],
    subtitle: json["subtitle"],
    isbn13: json["isbn13"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "isbn13": isbn13,
    "price": price,
    "image": image,
    "url": url,
  };
}

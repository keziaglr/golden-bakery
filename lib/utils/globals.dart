import 'package:qualification_flutter/models/product.dart';
import 'package:qualification_flutter/models/comment.dart';

var darkTheme = false;
var userNow = 'example';
var userEmail = 'example@example.com';

var products = [
  Product('cinammon.jpg', 'Cinammon Rolls', 'IDR 80.000'),
  Product('croissant.jpeg', 'Croissant', 'IDR 7.500'),
  Product('cupcake.jpeg', 'Cupcake', 'IDR 6.000'),
  Product('kastengel.jpg', 'Kastengel', 'IDR 50.000'),
  Product('nastar.jpg', 'Nastar', 'IDR 35.000'),
];

var comments = [
  Comment('Cinammon Rolls', 'kezia123', 'Very yummy!'),
  Comment('Cinammon Rolls', 'txt123', 'My favorite <3'),
  Comment('Cinammon Rolls', 'ab6ix', 'Highly recommended :D'),
  Comment('Cinammon Rolls', 'itzy', 'So delicious!')
];

import 'package:flutter/material.dart';
import 'package:trivia/domain/entity/trivia_category_entity.dart';

const BASE_URL = 'https://opentdb.com/api.php';
const DEFAULT_ERROR_MSG = 'Something went wrong, try again later';

typedef Json = Map<String, dynamic>;

const List<TriviaCategoryEntity> CATEGORIES = [
  TriviaCategoryEntity(9, 'General'),
  TriviaCategoryEntity(10, 'Books'),
  TriviaCategoryEntity(11, 'Film'),
  TriviaCategoryEntity(12, 'Music'),
  TriviaCategoryEntity(13, 'Musicals'),
  TriviaCategoryEntity(14, 'Television'),
  TriviaCategoryEntity(15, 'Video game'),
  TriviaCategoryEntity(16, 'Board game'),
  TriviaCategoryEntity(17, 'Science'),
  TriviaCategoryEntity(18, 'Computers'),
  TriviaCategoryEntity(19, 'Maths'),
  TriviaCategoryEntity(20, 'Mythology'),
  TriviaCategoryEntity(21, 'Sports'),
  TriviaCategoryEntity(22, 'Geography'),
  TriviaCategoryEntity(23, 'History'),
  TriviaCategoryEntity(24, 'Politics'),
  TriviaCategoryEntity(25, 'Art'),
  TriviaCategoryEntity(26, 'Celebrities'),
  TriviaCategoryEntity(27, 'Animals'),
  TriviaCategoryEntity(28, 'Vehicles'),
  TriviaCategoryEntity(29, 'Comics'),
  TriviaCategoryEntity(30, 'Gadgets'),
  TriviaCategoryEntity(31, 'Anime'),
  TriviaCategoryEntity(32, 'Cartoons'),
];

Map<int, Color> color = {
  50: Color.fromRGBO(224, 187, 97, .1),
  100: Color.fromRGBO(224, 187, 97, .2),
  200: Color.fromRGBO(224, 187, 97, .3),
  300: Color.fromRGBO(224, 187, 97, .4),
  400: Color.fromRGBO(224, 187, 97, .5),
  500: Color.fromRGBO(224, 187, 97, .6),
  600: Color.fromRGBO(224, 187, 97, .7),
  700: Color.fromRGBO(224, 187, 97, .8),
  800: Color.fromRGBO(224, 187, 97, .9),
  900: Color.fromRGBO(224, 187, 97, 1),
};

MaterialColor kColorCustom = MaterialColor(0xFFD4A048, color);

// NUMBER
// int

// CATEGORY
// general knowledge = 9
// books = 10
// film = 11
// music = 12
// musicals = 13
// television = 14
// video games = 15
// board games = 16
// science and nature = 17
// computers = 18
// mathematics = 19
// mythology = 20
// sports = 21
// geograpy = 22
// history = 23
// politics = 24
// art = 25
// celebrities = 26
// animals = 27
// vehicles = 28
// comics = 29
// gadgets = 30
// anime = 31
// cartoons = 32

// DIFICULTY
// easy
// medium
// hard

// TYPE
// multiple
// boolean

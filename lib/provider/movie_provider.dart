import '../model/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieProvider extends ChangeNotifier {
  List<Movie> _data = [];
  List<Movie> get dataMovie => _data;

  Future<List<Movie>> getMovie() async {
    final url = 'http://192.168.0.106/fluttermovies/read.php';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result.map<Movie>((json) => Movie.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}

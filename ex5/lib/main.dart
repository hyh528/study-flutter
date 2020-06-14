import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("GitHub search results"),
      ),
      body: FutureBuilder(
        future: searchRepositories(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final myJson = snapshot.data;
          final searchResults = myJson['items'];
          return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final searchResult = searchResults[index];
              return Text(searchResult['name']);
            },
          );
        },
      ),
    ));
  }
}

Future<Map<String, dynamic>> searchRepositories() async {
  final response =
      await http.get('https://api.github.com/search/repositories?q=flutter');
  final data = jsonDecode(response.body);
  return data;
}

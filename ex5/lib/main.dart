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

// class JSONGet extends StatefulWidget {
//   @override
//   _JSONGetState createState() => _JSONGetState();
// }

// class _JSONGetState extends State<JSONGet> {
//   Map<String, dynamic> data;
//   Future<String> getData() async {
//     http.Response response = await http.get(
//         Uri.encodeFull('https://api.github.com/search/repositories?q=flutter'),
//         headers: {"Accept": "application/json"});
//     print(response.body);
//     this.setState(() {
//       data = jsonDecode(response.body);
//     });
//     print(data['total_count']);
//     return "success";
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: new AppBar(
//         title: new Text("Json Viewer"),
//       ),
//       body: new ListView.builder(
//         itemCount: data == null ? 0 : data['items'].length,
//         itemBuilder: (BuildContext context, int index) {
//           return new Card(
//             child: new Text(data['items'][index]["name"]),
//           );
//         },
//       ),
//     ));
//   }
// }

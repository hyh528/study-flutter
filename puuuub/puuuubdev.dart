import 'package:http/http.dart' as http;

main() async {
  final response = await http.get('https://example.com/');
  print(response.body);
}

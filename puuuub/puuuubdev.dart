import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

main() async {
  final response = await http.Client().get(Uri.parse('https://example.com/'));

  var document = parse(response.body);
  print(document.outerHtml);
}

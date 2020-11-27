import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CatAPI {
  String _baseUrl = 'https://cat-fact.herokuapp.com/';
  String _factEndpoint = 'fact';

  Future<String> facts() async {
    final url = 'https://cat-fact.herokuapp.com/facts';
    var fact;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      fact = jsonResponse['all'][0]['text'];
      print(fact);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return fact;
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:meowfacts/slider_item.dart';

class CatAPI {
  String _baseUrl = 'https://cat-fact.herokuapp.com/';
  String _factEndpoint = 'fact';

  Future<List<SliderItem>> facts() async {
    final url = 'https://cat-fact.herokuapp.com/facts';
    var fact;
    List<SliderItem> sliderList = [];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var result in jsonResponse['all']) {
        fact = result['text'];
        sliderList.add(SliderItem(
          desc: fact,
        ));
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return sliderList;
  }
}

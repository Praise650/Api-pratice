import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class Network {
  static Future<List<Post>> getData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Invalid Result');
    }
  }
}

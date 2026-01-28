import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/court_model.dart';

class CourtService {
  Future<List<Court>> fetchCourts() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/courts'),
    );

    if (response.statusCode == 200) {
    final Map<String, dynamic> json =
        jsonDecode(response.body);

    final List data = json['data'];

    return data.map((e) => Court.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load courts');
  }
}
}
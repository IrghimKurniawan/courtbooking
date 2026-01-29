import 'dart:convert';
import 'package:http/http.dart' as http;

class BookingService {
  static Future<void> createBooking({
    required int courtId,
    required String date,
    required String startTime,
    required String endTime,
    required String token,
  }) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/bookings');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'court_id': courtId,
        'date': date,
        'start_time': startTime,
        'end_time': endTime,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode != 201) {
      throw Exception(data['message'] ?? 'Booking failed');
    }
  }
}

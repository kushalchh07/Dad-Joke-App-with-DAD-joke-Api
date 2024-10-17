import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/joke_model.dart';
// Import the model we created

class DadJokeRepository {
  // Base URL of the API
  static const String baseUrl = 'https://icanhazdadjoke.com/';

  // Function to fetch a random joke from the API
  Future<DadJOke?> fetchRandomJoke() async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json', // Ensures we get the response as JSON
        },
      );

      if (response.statusCode == 200) {
        // Decode the JSON response and return a DadJoke object
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return DadJOke.fromJson(jsonResponse);
      } else {
        print('Failed to load joke. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching joke: $e');
      return null;
    }
  }
}

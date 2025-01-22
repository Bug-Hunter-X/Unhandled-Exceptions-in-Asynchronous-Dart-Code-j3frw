```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
        return null; // Or throw a custom exception
      }
    } else {
      print('Request failed with status: ${response.statusCode}.  Reason: ${response.reasonPhrase}');
      return null; // Or throw a custom exception
    } 
  } on Exception catch (e) {
    print('Network request error: $e');
    return null; // Or throw a custom exception
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data received: $data');
  } else {
    print('Failed to fetch data.');
  }
}
```
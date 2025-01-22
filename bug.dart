```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during the network request or JSON decoding
    print('Error fetching data: $e');
    // Rethrow or handle the exception as needed
    rethrow; // Or handle the error appropriately for your app
  }
}
```
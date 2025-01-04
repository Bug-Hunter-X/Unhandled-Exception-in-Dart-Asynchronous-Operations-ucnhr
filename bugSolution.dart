```dart
import 'dart:async';

Future<void> fetchData() async {
  try {
    // Simulate a network request that might throw an exception
    await Future.delayed(Duration(seconds: 2));
    throw Exception('Network request failed');
  } on TimeoutException catch (e) {
    print('Timeout: $e');
    // Handle timeout
  } on Exception catch (e) {
    print('Error: $e');
    // Handle other exceptions.  Consider rethrowing for higher level handling.
    rethrow;
  } catch (e) {
    print('Unexpected error: $e');
    // Handle unexpected errors
  } finally {
    print('This always executes.');
  }
}

void main() async {
  try {
    await fetchData();
  } catch(e){
    print("Top level error handling: $e");
  }
}
```
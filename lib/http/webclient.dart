import 'package:http/http.dart';

// 1 - Add http dependency to pubscpec.yaml
// 2 - Create folder http inside lib
// 3 - Create webclient.dart and implement findAll()
// 4 - Call findAll in application startup
// 5 - Why is not working?
// 6 - Find you IP address or use 10.0.2.2

void findAll() async {
  print('>>>>>>>>>>>>>>>> findAll');
  final Response response = await get('http://192.168.0.100:8080/transactions');
  print('>>>>>>>>>>>>>>>> response received');
  print(response);
}
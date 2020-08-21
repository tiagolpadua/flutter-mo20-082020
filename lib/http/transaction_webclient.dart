import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

const String baseUrl = 'http://192.168.0.100:8080/transactions';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    return _toTransactions(response);
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);

    // -> use Map to be more "functional"
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    // -> refactor here to a simpler code
    return Transaction.fromJson(jsonDecode(response.body));
  }
}

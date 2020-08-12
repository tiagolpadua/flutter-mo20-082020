import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

const String ip = '192.168.0.100';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = 'http://$ip:8080/transactions';

Future<List<Transaction>> findAll() async {
  debugPrint('findAll');
  final Response response = await client
      .get('http://$ip:8080/transactions')
      .timeout(Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  debugPrint('findAll: $decodedJson');
  final List<Transaction> transactions = List();
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber
    }
  };

  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(baseUrl, headers: {
    'Content-type' : 'application/json',
    'password' : '1000'
  }, body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

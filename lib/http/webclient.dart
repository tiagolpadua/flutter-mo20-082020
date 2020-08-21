import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

import 'logging_interceptor.dart';


// 1 - Create a file called loggin_interceptor.dart and move LoggingInterceptor
// 2 - Create transaction_webclient.dart file and move save/findall methods to it
// 3 - Fix all the imports
// 4 - Refactor transactions form and list to use the new class TransactionWebClient

final Client client =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

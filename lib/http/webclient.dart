import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'logging-interceptor.dart';

const String ip = '192.168.0.100';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = 'http://$ip:8080/transactions';



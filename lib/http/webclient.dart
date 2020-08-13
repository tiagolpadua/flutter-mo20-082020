import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

// 1 - add http_interceptor to your pubspec.yaml
// 2 - Implement LoggingInterceptor a subclass of InterceptorContract
// 3 - Use HttpClientWithInterceptor to build your client
// 4 - Test everything

void findAll() async {
  Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get('http://192.168.0.100:8080/transactions');
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('>>>>>>>>>>>> sending request');
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('>>>>>>>>>>>> receiving response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

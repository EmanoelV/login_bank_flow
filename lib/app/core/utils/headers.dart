import 'package:get/get_connect/http/src/request/request.dart';

class Headers {
  static Request defaultHeader(Request request) {
    request.headers['Content-Type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    return request;
  }
}

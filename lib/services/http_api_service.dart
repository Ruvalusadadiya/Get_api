import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future getApi({
    required String url,
  }) async {
    try {
      if (kDebugMode) {
        print("URL ===> $url");
      }
      return http.get(Uri.parse(url));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}

import 'package:get_api_calling/model/product_list_model.dart';
import 'package:get_api_calling/services/http_api_service.dart';
import 'package:get_api_calling/utils/endpoint_res.dart';
import 'package:http/http.dart' as http;

class HomeAPI {
  static Future getdata() async {
    try {
      http.Response? response = await HttpService.getApi(url: EndPointRes.productAPI);
      if (response != null && response.statusCode == 200) {
        return productListFromJson(response.body);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

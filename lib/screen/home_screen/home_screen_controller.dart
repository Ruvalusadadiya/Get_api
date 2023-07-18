import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_api_calling/screen/home_screen/home_api.dart';
import '../../model/product_list_model.dart';

class HomeScreenController extends GetxController {
  List<ProductList>? productData;
  int count = 0;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    productData = await HomeAPI.getdata();

    if (kDebugMode) {
      print(productData![0].title);
    }
    update(["update"]);
  }

  void countplush(int index) {
    if (productData?[index].like == false) {
      productData?[index].like = true;
      count++;
    } else if (productData?[index].like == true) {
      productData?[index].like = false;
      count--;
    } else {}
    update(["Like"]);
  }
}

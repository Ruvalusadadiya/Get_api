import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_calling/screen/home_screen/home_screen_controller.dart';
import '../../utils/string_res.dart';

AppBar homeAppbar = AppBar(
    elevation: 0,
    backgroundColor: Colors.orange.shade200.withOpacity(0.6),
    title: const Text(StringRes.homeTitle),
    centerTitle: true,
    actions: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<HomeScreenController>(
            id: "Like",
            builder: (controller) => Stack(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                controller.count == 0
                    ? const SizedBox()
                    : Badge.count(
                        count: controller.count,
                      )
              ],
            ),
          ))
    ]);

Widget productList() {
  return GetBuilder<HomeScreenController>(
    id: "update",
    builder: (controller) {
      return controller.productData != null
          ? GridView.builder(
          
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
              ),
              itemCount: controller.productData!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      controller.productData![index].image!),
                                ),
                              ),
                            ),
                            GetBuilder<HomeScreenController>(
                              id: "Like",
                              builder: (controller) => Positioned(
                                  top: 9,
                                  right: 9,
                                  child: InkWell(
                                    onTap: () {
                                      controller.countplush(index);
                                    },
                                    child: controller.productData![index].like!
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            color: Colors.grey,
                                          ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Text(
                        controller.productData![index].title.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "\$${controller.productData![index].price}",
                              style: TextStyle(
                                  color: Colors.orange.shade200,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            const Spacer(),
                            const Icon(Icons.star_rate_rounded,
                                color: Colors.orange, size: 15),
                            Text(
                              "${controller.productData![index].rating!.rate}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "(${controller.productData![index].rating!.count})",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator());
    },
  );
}

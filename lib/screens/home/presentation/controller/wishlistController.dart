import 'package:get/get.dart';
import 'package:skyloov/screens/home/data/models/properties.dart';
import 'package:flutter/material.dart';

import '../../../../data/DatabaseHandler.dart';
import '../../../../utility/Dimensions.dart';
import '../../data/networks/remote_services.dart';

class WishlistController extends GetxController {
  late DatabaseHandler handler;

  RxList wishlistList = [].obs;

  int currentPage = 1;

  @override
  Future<void> onInit() async {
    handler = DatabaseHandler();
    getWishlist();
    super.onInit();
  }

  Future<void> getWishlist() async {
    wishlistList.value = await handler.retrieveProperties();
  }

  void addToWishlist(property) async {
    Dimensions.logger.i("addToCart called ${property.id}");
    int flag =0;
    String id = "";

    for (var wishlist in wishlistList) {
      if(wishlist.id == property.id) {
        flag++;
        id = wishlist.id!;
      }
    }

    if (flag == 0) {
      await handler.insertProperties(property);
    }

    var response  = await RemoteServices.addToWishlist(property);

    if (flag == 0) {
      if (response.statusCode == 200){
        Get.snackbar(
            "Add Wishlist to server",
            "Successfully",
            icon: Icon(Icons.bubble_chart_outlined, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white
        );
      }
    }else{
      if (response.statusCode == 200){
        Get.snackbar(
            "properties already on Wishlist",
            "Warning",
            icon: Icon(Icons.bubble_chart_outlined, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.amber,
            colorText: Colors.white
        );
      }
    }


  }

  void deleteFromWishlist(Properties property) async {
    var result = await handler.deleteProperties(property.id!);
    getWishlist();
    property.wishlist.value = false;
  }



}
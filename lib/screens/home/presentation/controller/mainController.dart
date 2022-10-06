import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/properties.dart';
import '../../data/networks/remote_services.dart';

class MainController extends GetxController {

  var propertiesList = <Properties>[].obs;

  RxBool isFilterEnable = false.obs;

  String searchValue = "";
  RxString emirateValue = "All".obs;
  RxString bathroomValue = "Bathroom".obs;
  RxString bedroomValue = "Bedroom".obs;
  RxString minValue = "1000".obs;
  RxString maxValue = "1000000".obs;


  Future<bool> onWillPop(BuildContext context) async {

      bool? exitResult = await showDialog(
        context: context,
        builder: (context) => _buildExitDialog(context),
      );
      return exitResult ?? false;

  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  void onInit(){
    fetchProperties();
    super.onInit();
  }

  void fetchProperties() async{

    var properties = await RemoteServices.fetchProperties(1);

    if(properties != null){
      propertiesList.value = properties;
    }

  }
}
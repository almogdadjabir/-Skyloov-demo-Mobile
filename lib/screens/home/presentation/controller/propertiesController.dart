import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/models/properties.dart';
import '../../data/networks/remote_services.dart';

class PropertiesController extends GetxController {


  RefreshController refreshController = RefreshController(initialRefresh: true);
  int currentPage = 1;
  var propertiesList = <Properties>[].obs;


  @override
  void onInit(){
    fetchProperties();
    super.onInit();
  }

  void fetchProperties() async{

    var properties = await RemoteServices.fetchProperties(currentPage);

    if(properties != null){
      propertiesList.value = properties;
      currentPage++;
    }

  }

Future<bool> refreshProperties() async{
    currentPage = 1;
    var properties = await RemoteServices.fetchProperties(currentPage);

    if(properties != null){
      propertiesList.value = properties;
      currentPage++;
      return true;
    }
    else{
      return false;
    }
  }

  Future<bool> loadMoreProperties() async{
    var properties = await RemoteServices.fetchProperties(currentPage);

    if(properties != null){
      propertiesList.addAll(properties);
      currentPage++;
      return true;
    }
    else{
      return false;
    }
  }

}
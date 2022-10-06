import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/models/properties.dart';
import '../../data/networks/remote_services.dart';

class FiltersController extends GetxController {


  RefreshController refreshController = RefreshController(initialRefresh: true);
  int currentPage = 1;
  var propertiesList = <Properties>[].obs;


  @override
  void onInit(){
    // fetchProperties();
    super.onInit();
  }

  void fetchProperties(
      searchValue,
      emirateValue,
      bathroomValue,
      bedroomValue,
      minValue,
      maxValue
      ) async{

    var properties = await RemoteServices.filtersProperties(
        currentPage,
        searchValue,
        emirateValue,
        bathroomValue,
        bedroomValue,
        minValue,
        maxValue
    );

    if(properties != null){
      propertiesList.value = properties;
      currentPage++;
    }

  }

Future<bool> refreshProperties(
    searchValue,
    emirateValue,
    bathroomValue,
    bedroomValue,
    minValue,
    maxValue) async{
    currentPage = 1;
    var properties = await RemoteServices.filtersProperties(
        currentPage,
        searchValue,
        emirateValue,
        bathroomValue,
        bedroomValue,
        minValue,
        maxValue
    );

    if(properties != null){
      propertiesList.value = properties;
      currentPage++;
      return true;
    }
    else{
      return false;
    }
  }

  Future<bool> loadMoreProperties(
      searchValue,
      emirateValue,
      bathroomValue,
      bedroomValue,
      minValue,
      maxValue
      ) async{
    var properties = await RemoteServices.filtersProperties(
        currentPage,
        searchValue,
        emirateValue,
        bathroomValue,
        bedroomValue,
        minValue,
        maxValue
    );

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
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../utility/constants.dart';
import '../../../../utility/dependencies_provider.dart';
import '../models/properties.dart';

class RemoteServices{

  static Future<List<Properties>> fetchProperties(int currentPage) async {
    Response response = await getIt<Dio>().get('${Constants.baseUrl}properties?page=$currentPage&limit=5');
    return List<Properties>.from(response.data.map((x) => Properties.fromJson(x)));
  }

  static Future<List<Properties>> filtersProperties(int currentPage,
      String searchValue,
      String emirateValue,
      String bathroomValue,
      String bedroomValue,
      String minValue,
      String maxValue) async {

    String filters = emirateValue != "All" ? '&emirate=$emirateValue' : "";
    filters = filters + (searchValue != ""  ? '&search=$searchValue' : "");
    filters = filters + (bathroomValue  != "Bathroom"  ? '&bathroom=$bathroomValue' : "");
    filters = filters + (bedroomValue != "Bedroom"  ? '&bedroom=$bedroomValue' : "");
    filters = filters + (minValue != "1000"  ? '&minPrice=$minValue' : "");
    filters = filters + (maxValue != "1000000"  ? '&maxPrice=$maxValue' : "");

    Response response = await getIt<Dio>().get('${Constants.baseUrl}properties?page=$currentPage&limit=2$filters');
    return List<Properties>.from(response.data.map((x) => Properties.fromJson(x)));
  }


  /// dummy UserID Just for Implements,
  /// in real Scenario Should Be JWT Token
  /// */

  static Future<Response> addToWishlist(Properties properties) async {
    var params =  {
      "user": 1,
      "property": properties.id,
    };

    Response response = await getIt<Dio>().post('${Constants.baseUrl}wishlist',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
    return response;
  }
}
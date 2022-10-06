import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../utility/Dimensions.dart';
import '../../../../widgets/BigText.dart';
import '../controller/filtersController.dart';
import '../widgets/propertyTile.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen(
      this.searchValue,
      this.emirateValue,
      this.bathroomValue,
      this.bedroomValue,
      this.minValue,
      this.maxValue, {
        Key? key}) : super(key: key);

  final String searchValue;
  final String emirateValue;
  final String bathroomValue;
  final String bedroomValue;
  final String minValue;
  final String maxValue;

  @override
  Widget build(BuildContext context) {
    return GetX<FiltersController>(
        init: FiltersController(),
        builder: (filtersController) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: BigText(text: 'Filter Properties', fontWeight: FontWeight.w200,),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SmartRefresher(
              controller: filtersController.refreshController,
              enablePullUp: true,
              onRefresh: () async{
                final result = await filtersController.refreshProperties(
                    searchValue,
                    emirateValue,
                    bathroomValue,
                    bedroomValue,
                    minValue,
                    maxValue
                );
                if(result){
                  filtersController.refreshController.refreshCompleted();
                }else{
                  filtersController.refreshController.refreshFailed();
                }
              },
              onLoading: () async{
                final result = await filtersController.loadMoreProperties(
                    searchValue,
                    emirateValue,
                    bathroomValue,
                    bedroomValue,
                    minValue,
                    maxValue
                );
                if(result){
                  filtersController.refreshController.loadComplete();
                }else{
                  filtersController.refreshController.loadFailed();
                }
              },
              child: filtersController.propertiesList.isEmpty ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/search.json'),
                  BigText(
                      text: 'Sorry, No Match!',
                      fontWeight: FontWeight.w200,
                      size: Dimensions.getAdaptiveTextSize(14)
                  ),
                  SizedBox(height: Dimensions.screenHeight*0.008,),

                  BigText(
                    text: 'Please try to change the Filters',
                    fontWeight: FontWeight.w200,
                    size: Dimensions.getAdaptiveTextSize(14),
                  ),
                  SizedBox(height: Dimensions.screenHeight*0.008,),


                ],
              )
                  :
              MasonryGridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: context.isTablet ? 4 : 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                itemCount: filtersController.propertiesList.length,
                itemBuilder: (context, index) {
                  return PropertyTile(
                      filtersController.propertiesList[index]
                  );
                },
              ),
            ),
          ),
        );
      }
    );
  }
}

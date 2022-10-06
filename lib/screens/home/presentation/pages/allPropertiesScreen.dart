import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../widgets/BigText.dart';
import '../controller/PropertiesController.dart';
import '../widgets/propertyTile.dart';

class AllPropertiesScreen extends StatelessWidget {
  const AllPropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PropertiesController>(
        init: PropertiesController(),
        builder: (propertiesController) {
          return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: BigText(text: 'All Properties', fontWeight: FontWeight.w200,),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SmartRefresher(
              controller: propertiesController.refreshController,
              enablePullUp: true,
              onRefresh: () async{
                final result = await propertiesController.refreshProperties();
                if(result){
                  propertiesController.refreshController.refreshCompleted();
                }else{
                  propertiesController.refreshController.refreshFailed();
                }
              },
              onLoading: () async{
                final result = await propertiesController.loadMoreProperties();
                if(result){
                  propertiesController.refreshController.loadComplete();
                }else{
                  propertiesController.refreshController.loadFailed();
                }
              },
              child: MasonryGridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: context.isTablet ? 4 : 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                itemCount: propertiesController.propertiesList.length,
                itemBuilder: (context, index) {
                  return PropertyTile(
                      propertiesController.propertiesList[index]
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

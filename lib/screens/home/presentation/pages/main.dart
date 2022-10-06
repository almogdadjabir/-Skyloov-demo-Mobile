import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:skyloov/screens/home/presentation/pages/allPropertiesScreen.dart';
import 'package:skyloov/screens/home/presentation/widgets/mainHeader.dart';
import 'package:skyloov/utility/AppColors.dart';
import 'package:skyloov/utility/Dimensions.dart';
import '../../../../widgets/BigText.dart';
import '../controller/mainController.dart';
import '../widgets/propertyTile.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        init: MainController(),
        builder: (mainController) {
          return WillPopScope(
            onWillPop: () => mainController.onWillPop(context),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: mainController.isFilterEnable.value ? Dimensions.screenHeight*0.37 : Dimensions.screenHeight*0.23,
                      color: AppColors.kPrimaryColor,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: MainHeader(),
                      ),
                    ),
                    Container(
                      color: Color(0xfff6f8fc),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  text: 'Near You',
                                  fontWeight: FontWeight.w200,
                                  size: Dimensions.getAdaptiveTextSize(14),
                                  color: AppColors.kTitleTextColor,
                                ),
                                TextButton(
                                  child: Row(
                                    children: [
                                      Icon(Icons.keyboard_arrow_down),
                                      SizedBox(width: Dimensions.screenWidth * 0.01,),
                                      BigText(
                                        text: 'View All',
                                        fontWeight: FontWeight.w100,
                                        size: Dimensions.getAdaptiveTextSize(12),
                                        color: AppColors.kPrimaryColor,
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    Get.to(()=> AllPropertiesScreen());
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: (Dimensions.screenHeight*0.3) * 0.05,),
                            SizedBox(
                              height: Dimensions.screenHeight*0.5,
                              child: MasonryGridView.count(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  crossAxisCount: context.isTablet ? 2 : 1,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 0,
                                  itemCount: mainController.propertiesList.length,
                                  itemBuilder: (context, index) {
                                    return PropertyTile(
                                        mainController.propertiesList[index]
                                    );
                                  },
                                ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

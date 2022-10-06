import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utility/AppColors.dart';
import '../../../../utility/Dimensions.dart';
import '../../../../widgets/BigText.dart';
import '../../data/models/tags.dart';
import '../controller/mainController.dart';
import '../pages/SearchScreen.dart';
import '../pages/wishlistScreen.dart';
import 'TagTile.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());

    return Column(
      children: [
        SizedBox(height: (Dimensions.screenHeight*0.3) * 0.1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(
              text: 'Good Morning',
              fontWeight: FontWeight.w200,
              size: Dimensions.getAdaptiveTextSize(16),
              color: Colors.white,
            ),

            TextButton(
              child: Row(
                children: [
                  Icon(Icons.bubble_chart, color: Colors.white,),
                  SizedBox(width: Dimensions.screenWidth * 0.01,),
                  BigText(
                    text: 'Wishlist',
                    fontWeight: FontWeight.w100,
                    size: Dimensions.getAdaptiveTextSize(12),
                    color: Colors.white,
                  )
                ],
              ),
              onPressed: () async {
                Get.to(const WishListScreen());
              },
            )
          ],
        ),
        SizedBox(height: (Dimensions.screenHeight*0.3) * 0.05,),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  alignment: Alignment.centerLeft,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 1,
                        offset: Offset(0, 1),)
                    ],
                  ),
                  child: TextField(

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.white),
                      ),
                      hintText: 'Find your next apartment',),
                    onChanged: (value) {
                      mainController.searchValue = value;
                    },
                  ),
                )
              ),
              Obx(() => TextButton(
                child: Row(
                  children: [
                    Icon(
                      mainController.isFilterEnable.value ?
                        Icons.search : Icons.filter_alt_outlined, color: Colors.white,),
                    SizedBox(width: Dimensions.screenWidth * 0.01,),
                    BigText(
                      text: mainController.isFilterEnable.value ? 'Search' : 'Filters',
                      fontWeight: FontWeight.w100,
                      size: Dimensions.getAdaptiveTextSize(12),
                      color: Colors.white,
                    )
                  ],
                ),
                onPressed: () {
                  if (mainController.isFilterEnable.value) {
                    mainController.isFilterEnable.toggle();

                    Get.to(()=>
                        SearchScreen(
                          mainController.searchValue,
                          mainController.emirateValue.value,
                          mainController.bathroomValue.value,
                          mainController.bedroomValue.value,
                          mainController.minValue.value,
                          mainController.maxValue.value,
                        )
                    );

                    mainController.searchValue = "";
                  }
                  else {
                    mainController.isFilterEnable.toggle();
                  }
                },
              ),),
            ],
        ),
        SizedBox(height: (Dimensions.screenHeight*0.3) * 0.05,),
        Obx(() =>
            mainController.isFilterEnable.value ?
              Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimensions.screenWidth * 0.6,
                          padding: EdgeInsets.only(left: 10, right: 0),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButton<String>(
                            value: mainController.emirateValue.value,
                            items: <String>['All', 'Abu Dhabi', 'Dubai', 'Sharjah', 'Ajman', 'Umm Al Quwain', 'Ras Al Khaimah', 'Fujairah'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,),
                              );
                            }).toList(),
                            // add extra sugar..
                            icon: Visibility (visible:false, child: Icon(Icons.keyboard_arrow_down_outlined)),
                            iconSize: 25,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              mainController.emirateValue.value = newValue!;
                            },
                          ),
                        ),

                        Container(
                          width: Dimensions.screenWidth * 0.3,
                          padding: EdgeInsets.only(left: 10, right: 0),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButton<String>(
                            value: mainController.bedroomValue.value,
                            items: <String>['Bedroom', '1', '2', '3', '4', '5', '6', '7', '7'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,),
                              );
                            }).toList(),
                            // add extra sugar..
                            icon: Visibility (visible:false, child: Icon(Icons.keyboard_arrow_down_outlined)),
                            iconSize: 25,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              mainController.bedroomValue.value = newValue!;
                            },
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: Dimensions.screenHeight*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Dimensions.screenWidth * 0.3,
                          padding: EdgeInsets.only(left: 10, right: 0),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButton<String>(
                            value: mainController.bathroomValue.value,
                            items: <String>['Bathroom', '1', '2', '3', '4', '5', '6', '7', '7'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,),
                              );
                            }).toList(),
                            // add extra sugar..
                            icon: Visibility (visible:false, child: Icon(Icons.keyboard_arrow_down_outlined)),
                            iconSize: 25,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              mainController.bathroomValue.value = newValue!;
                            },
                          ),
                        ),

                        Container(
                          width: Dimensions.screenWidth * 0.3,
                          padding: EdgeInsets.only(left: 10, right: 0),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButton<String>(
                            value: mainController.minValue.value,
                            items: <String>['1000', '10000', '20000', '30000', '40000', '50000', '60000', '70000'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,),
                              );
                            }).toList(),
                            // add extra sugar..
                            icon: Visibility (visible:false, child: Icon(Icons.keyboard_arrow_down_outlined)),
                            iconSize: 25,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              mainController.minValue.value = newValue!;
                            },
                          ),
                        ),

                        Container(
                          width: Dimensions.screenWidth * 0.3,
                          padding: EdgeInsets.only(left: 10, right: 0),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButton<String>(
                            value: '${mainController.maxValue.value}',
                            items: <String>['1000000', '800000', '600000', '500000', '400000', '300000', '200000', '100000'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,),
                              );
                            }).toList(),
                            // add extra sugar..
                            icon: Visibility (visible:false, child: Icon(Icons.keyboard_arrow_down_outlined)),
                            iconSize: 25,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              mainController.maxValue.value = newValue!;
                            },
                          ),
                        ),

                      ],
                    ),

                  ],

              ) : Container(),
        )
        // Expanded(
        //   child: MasonryGridView.count(
        //     padding: EdgeInsets.zero,
        //     crossAxisCount: context.isTablet ? 5 : 3,
        //     mainAxisSpacing: 8,
        //     crossAxisSpacing: 5,
        //     itemCount: tagsList.length,
        //     itemBuilder: (context, index) {
        //       return TagTile(
        //           tagsList[index]
        //       );
        //     },
        //   ),
        //
        // ),
      ],
    );
  }
}

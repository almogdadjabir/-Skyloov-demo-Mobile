import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:skyloov/utility/AppColors.dart';
import '../../../../utility/Dimensions.dart';
import '../../../../widgets/BigText.dart';
import '../controller/PropertiesController.dart';
import '../controller/wishlistController.dart';
import '../widgets/wishlistTile.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<WishlistController>(
        init: WishlistController(),
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
              child: BigText(text: 'Wishlist', fontWeight: FontWeight.w200,),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: propertiesController.wishlistList.length == 0 ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/wishlist.json'),
                      BigText(
                          text: 'Wishlist is empty!',
                          fontWeight: FontWeight.w200,
                          size: Dimensions.getAdaptiveTextSize(14)
                      ),
                      SizedBox(height: Dimensions.screenHeight*0.008,),

                      BigText(
                        text: 'you can add Properties to wishlist by',
                        fontWeight: FontWeight.w200,
                        size: Dimensions.getAdaptiveTextSize(14),
                      ),
                      SizedBox(height: Dimensions.screenHeight*0.008,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                              text: ' press on',
                              fontWeight: FontWeight.w200,
                            size: Dimensions.getAdaptiveTextSize(14),
                          ),

                          SizedBox(width: Dimensions.screenWidth*0.01,),

                          Icon(Icons.favorite_outline, color: AppColors.kPrimaryColor,),

                          SizedBox(width: Dimensions.screenWidth*0.01,),

                          BigText(text: 'like button',
                            fontWeight: FontWeight.w200,
                            size: Dimensions.getAdaptiveTextSize(14),
                          ),
                        ],
                      ),

                    ],
                  )
                  : MasonryGridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: context.isTablet ? 4 : 1,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: propertiesController.wishlistList.length,
                        itemBuilder: (context, index) {
                          return wishlistTile(
                              propertiesController.wishlistList[index]
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
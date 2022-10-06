import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:skyloov/utility/AppColors.dart';
import 'package:skyloov/widgets/BigText.dart';
import '../../../../utility/Dimensions.dart';
import '../../data/models/properties.dart';
import '../controller/PropertiesController.dart';
import '../controller/wishlistController.dart';
import '../pages/detailsScreens.dart';

class wishlistTile extends StatelessWidget {
  final Properties property;
  wishlistTile(this.property, {Key? key}) : super(key: key);

  final WishlistController productDetailsController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {

    return Material(
      child: InkWell(
        child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (Dimensions.screenHeight * 0.3) * 0.655,
                  width:  Dimensions.screenWidth * 0.3,
                  child: CachedNetworkImage(
                    imageUrl: '${property.imageURL}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                        ),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: (Dimensions.screenHeight * 0.3) * 0.655,
                  width: Dimensions.screenWidth*0.65,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Dimensions.screenWidth*0.48,
                              child: BigText(
                                text: '${property.title}'.toUpperCase(),
                                fontWeight: FontWeight.w500,
                                size: Dimensions.getAdaptiveTextSize(12),
                                color: AppColors.kTitleTextColor,
                                maxLines: 2,),
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.grey.withOpacity(0.1),
                                child: InkWell(
                                  splashColor: AppColors.kPrimaryColor.withOpacity(0.5),
                                  onTap: () {
                                    productDetailsController.deleteFromWishlist(property);
                                  },
                                  child: SizedBox(width: 30, height: 30, child: Icon(Icons.delete, color: AppColors.kPrimaryColor,)),
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.03,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.kTitleTextColor.withOpacity(0.5),
                              size: 18,
                            ),
                            Expanded(
                              child: BigText(
                                text: '${property.location}',
                                fontWeight: FontWeight.w500,
                                size: Dimensions.getAdaptiveTextSize(11),
                                color: AppColors.kTitleTextColor.withOpacity(0.6),),
                            ),
                          ],
                        ),

                        Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: '${property.price} AED',
                              fontWeight: FontWeight.w800,
                              size: Dimensions.getAdaptiveTextSize(12),
                              color: AppColors.kPrimaryColor,),

                            TextButton(
                              child: BigText(
                                text: 'speak with agent',
                                fontWeight: FontWeight.w800,
                                size: Dimensions.getAdaptiveTextSize(12),
                                color: AppColors.kTitleTextColor,
                              ),
                              onPressed: () {
                                UrlLauncher.launch("tel://+971544097335");
                              },
                            )

                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreens(property),
          ));
        },
      ),
    );
  }
}

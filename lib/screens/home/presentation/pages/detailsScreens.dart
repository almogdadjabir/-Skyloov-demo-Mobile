import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../../../utility/AppColors.dart';
import '../../../../utility/Dimensions.dart';
import '../../../../widgets/BigText.dart';
import '../../data/models/properties.dart';
import '../controller/PropertiesController.dart';
import '../controller/wishlistController.dart';

class DetailsScreens extends StatelessWidget {
  final Properties property;
  const DetailsScreens(this.property, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<WishlistController>(
        init: WishlistController(),
        builder: (propertiesController) {
        return Scaffold(
          backgroundColor: Color(0xfff6f8fc),
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              bottomOpacity: 0.0,
              // title:
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 5,),
                  ClipOval(
                    child: Material(
                      color: Colors.white.withOpacity(0.3), // Button color
                      child: InkWell(
                        splashColor: Colors.blue.withOpacity(0.8), // Splash color
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SizedBox(
                            width: 45,
                            height: 45,
                            child: Icon(Icons.arrow_back, color: Colors.white,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              title: Align(
                alignment: Alignment.centerRight,
                child: ClipOval(
                  child: Material(
                    color: Colors.white.withOpacity(0.3), // Button color
                    child: InkWell(
                      splashColor: Colors.blue.withOpacity(0.8), // Splash color
                      onTap: () {
                        property.wishlist.toggle();
                        propertiesController.addToWishlist(property);
                      },
                      child: Obx(() => SizedBox(
                        width: 45,
                        height: 45,
                        child: Icon(property.wishlist.value ? Icons.favorite_outline : Icons.favorite, color: Colors.white,),
                      )),
                    ),
                  ),
                ),
              )
          ),
          body: SizedBox(
            height: Dimensions.screenHeight,
            child: Stack(
              children: [
                Container(
                  height: Dimensions.screenHeight * 0.5,
                  child: CachedNetworkImage(
                    imageUrl: '${property.imageURL}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0),
                        ),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: (Dimensions.screenHeight * 0.5) - (Dimensions.screenHeight * 0.2),
                    left: 16,
                    right: 16,
                    child:
                    Hero(
                      tag: 'property_${property.id}',
                      child: Container(
                        height: Dimensions.screenHeight * 0.5,
                        width: Dimensions.screenWidth * 0.8,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: '${property.title}'.toUpperCase(),
                              fontWeight: FontWeight.w800,
                              size: Dimensions.getAdaptiveTextSize(16),
                              color: AppColors.kTitleTextColor,
                            ),

                            SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.03,),

                            Row(
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

                            SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.1,),

                            Row(
                              children: [
                                Icon(
                                  Icons.domain,
                                  color: AppColors.kTitleTextColor.withOpacity(0.5),
                                  size: 18,
                                ),
                                SizedBox(width: Dimensions.screenWidth*0.01,),
                                BigText(
                                  text: '${property.distance} m',
                                  fontWeight: FontWeight.w800,
                                  size: Dimensions.getAdaptiveTextSize(12),
                                  color: AppColors.kTitleTextColor.withOpacity(0.6),),

                                SizedBox(width: Dimensions.screenWidth*0.03,),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.bathtub_outlined,
                                      color: AppColors.kTitleTextColor.withOpacity(0.5),
                                      size: 18,
                                    ),
                                    SizedBox(width: Dimensions.screenWidth*0.01,),
                                    BigText(
                                      text: '${property.bathroom}',
                                      fontWeight: FontWeight.w800,
                                      size: Dimensions.getAdaptiveTextSize(12),
                                      color: AppColors.kTitleTextColor.withOpacity(0.6),),
                                  ],
                                ),
                                SizedBox(width: Dimensions.screenWidth*0.03,),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.bed,
                                      color: AppColors.kTitleTextColor.withOpacity(0.5),
                                      size: 18,
                                    ),
                                    SizedBox(width: Dimensions.screenWidth*0.01,),
                                    BigText(
                                      text: '${property.bedroom}',
                                      fontWeight: FontWeight.w800,
                                      size: Dimensions.getAdaptiveTextSize(12),
                                      color: AppColors.kTitleTextColor.withOpacity(0.6),),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.1,),


                            Expanded(
                              child: BigText(
                                text: '${property.description}',
                                fontWeight: FontWeight.w100,
                                size: Dimensions.getAdaptiveTextSize(13),
                                color: AppColors.kTextColor,
                                maxLines: 6
                              ),
                            ),


                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  text: '${property.price} AED'.toUpperCase(),
                                  fontWeight: FontWeight.w800,
                                  size: Dimensions.getAdaptiveTextSize(16),
                                  color: AppColors.kPrimaryColor,
                                ),
                                Obx(() => TextButton(
                                  child: Row(
                                    children: [
                                      Icon(property.wishlist.value ? Icons.favorite_outline : Icons.favorite),
                                      SizedBox(width: Dimensions.screenWidth * 0.01,),
                                      BigText(
                                        text: 'Add to wishlist',
                                        fontWeight: FontWeight.w100,
                                        size: Dimensions.getAdaptiveTextSize(12),
                                        color: AppColors.kPrimaryColor,
                                      )
                                    ],
                                  ),
                                  onPressed: () async {
                                    property.wishlist.toggle();
                                    propertiesController.addToWishlist(property);
                                  },
                                )),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                ),
                Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child:
                    Container(
                      height: Dimensions.screenHeight * 0.1,
                      width: Dimensions.screenWidth * 0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                              ),
                              SizedBox(width: Dimensions.screenWidth * 0.04,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: 'Sarah Khalid',
                                    fontWeight: FontWeight.w800,
                                    size: Dimensions.getAdaptiveTextSize(14),
                                    color: AppColors.kTitleTextColor,),

                                  BigText(
                                    text: 'Property Agency',
                                    fontWeight: FontWeight.w100,
                                    size: Dimensions.getAdaptiveTextSize(10),
                                    color: AppColors.kTitleTextColor.withOpacity(0.5),),
                                ],
                              ),
                            ],
                          ),
                          ClipOval(
                            child: Material(
                              color: Color(0xfff5f7f9), // Button color
                              child: InkWell(
                                splashColor: Colors.blue.withOpacity(0.8), // Splash color
                                onTap: () {
                                  UrlLauncher.launch("tel://+971544097335");
                                },
                                child: const SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Icon(Icons.call, color: AppColors.kPrimaryColor,),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

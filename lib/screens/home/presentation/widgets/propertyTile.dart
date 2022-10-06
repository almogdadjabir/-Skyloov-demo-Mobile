import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyloov/utility/AppColors.dart';
import 'package:skyloov/widgets/BigText.dart';
import '../../../../utility/Dimensions.dart';
import '../../data/models/properties.dart';
import '../pages/detailsScreens.dart';

class PropertyTile extends StatelessWidget {
  final Properties property;
  const PropertyTile(this.property, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'property_${property.id}',
      child: Material(
        child: InkWell(
          child: Container(
            width: Dimensions.screenWidth * 0.7,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (Dimensions.screenHeight * 0.5) * 0.5,
                  child: CachedNetworkImage(
                    imageUrl: '${property.imageURL}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.0),
                            topLeft: Radius.circular(25.0),
                          ),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.02,),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: '${property.title}'.toUpperCase(),
                        fontWeight: FontWeight.w500,
                        size: Dimensions.getAdaptiveTextSize(12),
                        color: AppColors.kTitleTextColor,),

                      SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.03,),

                      BigText(
                        text: '${property.location}',
                        fontWeight: FontWeight.w500,
                        size: Dimensions.getAdaptiveTextSize(11),
                        color: AppColors.kTitleTextColor.withOpacity(0.6),),

                      SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.01,),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.kTitleTextColor.withOpacity(0.5),
                            size: 18,
                          ),
                          Expanded(
                            child: BigText(
                              text: '${property.emirate}',
                              fontWeight: FontWeight.w500,
                              size: Dimensions.getAdaptiveTextSize(11),
                              color: AppColors.kTitleTextColor.withOpacity(0.6),),
                          ),
                        ],
                      ),
                      SizedBox(height: (Dimensions.screenHeight * 0.5) * 0.1,),

                      Row(
                        children: [
                          BigText(
                            text: '${property.price} AED',
                            fontWeight: FontWeight.w800,
                            size: Dimensions.getAdaptiveTextSize(14),
                            color: AppColors.kPrimaryColor,),

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
                      )

                    ],
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
      ),
    );
  }
}

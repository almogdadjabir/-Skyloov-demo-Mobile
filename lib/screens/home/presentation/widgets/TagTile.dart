import 'package:flutter/material.dart';
import 'package:skyloov/widgets/BigText.dart';
import 'package:get/get.dart';
import '../../../../utility/Dimensions.dart';
import '../../data/models/tags.dart';

class TagTile extends StatelessWidget {
  final Tags tag;
  const TagTile(this.tag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: tag.isSelect.value ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: InkWell(
        splashColor: Colors.blue.withOpacity(0.8), // Splash color
        onTap: () {
          tag.isSelect.toggle();
        },
        child: Center(
          child: BigText(text: '${tag.tag}', fontWeight: FontWeight.w100, color: Colors.white,size: Dimensions.getAdaptiveTextSize(12),),
        ),
      ),
    ));
  }
}

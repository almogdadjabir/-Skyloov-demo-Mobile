import 'package:flutter/cupertino.dart';

import '../utility/Dimensions.dart';

class BigText extends StatelessWidget {

  Color? color;
  final String text;
  int maxLines;
  double size;
  double letterSpacing;
  TextOverflow overFlow;
  FontWeight fontWeight;

  BigText({Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    required this.fontWeight,
    this.size = 0,
    this.maxLines = 100,
    this.letterSpacing = 0,
    this.overFlow = TextOverflow.ellipsis
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: fontWeight,
        fontSize: size==0?Dimensions.font20:size,
        letterSpacing: letterSpacing
      ),

    );
  }
}

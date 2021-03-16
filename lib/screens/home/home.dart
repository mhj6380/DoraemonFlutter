import 'package:flutter/material.dart';
import '../feed/horizontalSwiperContents.dart';
import '../feed/basicGridViewContents.dart';
import '../material/basicSlideBanner.dart';


class Home extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ MainSlideBanner(),HorizontalSwiperContents(feedTitle:"추천 라이브"), BasicGridViewContents(feedTitle:"오늘의 HOT콘텐츠")]
    );
  }
}

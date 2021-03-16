import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

CarouselSlider MainSlideBanner() {
  List<String> bannerList = [
    "https://cdnb.pikicast.com/300/2021/03/09/300_850652_1615276140.png",
    "https://cdnb.pikicast.com/300/2021/03/12/300_850745_1615540056.png",
    "https://cdnb.pikicast.com/300/2021/03/07/300_851126_1615088460.png",
    "https://cdnb.pikicast.com/300/2021/03/12/300_850368_1615517314.png",
    "https://cdnb.pikicast.com/300/2021/03/07/300_851066_1615088303.png",
  ];

  return CarouselSlider(
    options: CarouselOptions(
      height: 230.0,
      viewportFraction: 1,
      autoPlay: true,
    ),
    items: [0, 1,2,3,4].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage( 
                height: 330,
                fit:BoxFit.cover,
                width: double.infinity,
                imageUrl: bannerList[i],
                placeholder: (context, url) => Container(
                  child: Center(child: new CircularProgressIndicator(),),
                ), 
                errorWidget: (context, url, error) => Icon(Icons.error),
              ));
        },
      );
    }).toList(),
  );
}

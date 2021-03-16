import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
    @required this.size,
    @required this.imageUrl,
  }) : super(key: key);

  final String size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new CachedNetworkImageProvider(imageUrl),
          ),
        ));
  }
}

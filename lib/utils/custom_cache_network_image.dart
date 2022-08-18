import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;
  final Widget placeholderWidget;
  final double? height;
  final double? width;

  const CustomNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.boxFit = BoxFit.fill,
      this.height,
      this.width,
      required this.placeholderWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      height: height,
      width: width,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => placeholderWidget,
      placeholder: (context, url) => placeholderWidget,
    );
  }
}

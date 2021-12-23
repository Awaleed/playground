import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/app_config.dart';

abstract class UiUtils {
  static Brightness? _brightness;
  static Color getWhiteColorWithBrightness(
    BuildContext? context, {
    Color? lightThemeColor,
    Color? darkThemeColor,
  }) {
    if (context != null) _brightness = Theme.of(context).brightness;
    if (_brightness == Brightness.light) {
      return lightThemeColor ?? Colors.white;
    } else {
      return darkThemeColor ?? Colors.grey.shade800;
    }
  }

  static Color getWhiteTextColorWithBrightness(
    BuildContext? context, {
    Color? lightThemeColor,
    Color? darkThemeColor,
  }) {
    if (context != null) _brightness = Theme.of(context).brightness;
    if (_brightness == Brightness.light) {
      return lightThemeColor ?? Colors.black;
    } else {
      return darkThemeColor ?? Colors.white;
    }
  }

  static String formatCurrency(num? price, {int decimalDigits = 0}) {
    return NumberFormat.currency(
      decimalDigits: decimalDigits,
      symbol: '',
    ).format(price);
  }

  static Widget buildAvatarImage(String? image) {
    // if (image == null || image.isEmpty || !isURL(image)) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.network(
        image ?? '',
        fit: BoxFit.contain,
        alignment: Alignment.center,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error_outline);
        },
      ),
    );
    // } else {
    //   final heroTag = faker.guid.guid();
    //   return GestureDetector(
    //     onTap: () {
    //       AppRouter.sailor.navigatorKey?.currentState?.push(
    //         PageRouteBuilder(
    //           pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
    //             appBar: const TalebAppBar(),
    //             body: PhotoView(
    //               enableRotation: true,
    //               imageProvider: NetworkImage(image),
    //               minScale: PhotoViewComputedScale.contained,
    //               heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
    //               errorBuilder: (context, url, error) => Image.asset(
    //                   'assets/images/account_image.png',
    //                   fit: BoxFit.cover),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //     child: Hero(
    //       tag: heroTag,
    //       child: Image.network(
    //         image,
    //         errorBuilder: (context, url, error) =>
    //             Image.asset('assets/icons/Group 10386.png', fit: BoxFit.cover),
    //         fit: BoxFit.contain,
    //       ),
    //     ),
    //   );
    // }
  }

  static Widget buildProductImages(List<String>? images) {
    // if (images == null || images.isEmpty)
    return Image.asset('assets/images/account_image.png', fit: BoxFit.cover);
    // final heroTag = faker.guid.guid();
    // return GestureDetector(
    //     onTap: () {
    //       AppRouter.sailor.navigatorKey?.currentState?.push(
    //         PageRouteBuilder(
    //           pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
    //             appBar: const TalebAppBar(),
    //             body: PhotoViewGallery.builder(
    //               itemCount: images.length,
    //               enableRotation: true,
    //               builder: (context, index) {
    //                 final image = images[index];
    //                 return PhotoViewGalleryPageOptions(
    //                   minScale: PhotoViewComputedScale.contained,
    //                   imageProvider: NetworkImage(image),
    //                   heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
    //                   errorBuilder: (context, url, error) => Image.asset(
    //                       'assets/images/account_image.png',
    //                       fit: BoxFit.cover),
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //     child: Hero(
    //       tag: heroTag,
    //       child: CarouselSlider.builder(
    //         options: CarouselOptions(height: kAppSizes.appVerticalPadding(30)),
    //         itemCount: images.length,
    //         itemBuilder: (context, index, realIndex) {
    //           final image = images[index];
    //           return UiUtils.buildAvatarImage(image);
    //         },
    //       ),
    //     ),
    //   );
  }
}

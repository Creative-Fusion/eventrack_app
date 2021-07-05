import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class ETCard extends StatelessWidget {
  ///Adds a padded `Card` with `radius: 12` in each corner.
  const ETCard({
    Key? key,
    //TODO: Make this required.
    this.route,
    required this.argument,
    required this.child,
    this.color,
    this.width = double.infinity,
    this.height = 100,
    this.addShadow = true,
  }) : super(key: key);

  ///Requires a route of a detail screen to navigate on tappping the card.
  ///
  ///Example: Routes.EVENT_DETAIL
  final String? route;

  ///Requires a model value as an argument to pass on to the next `route`.
  final Object argument;

  ///`BackgroundColor` of the card. Defaults to `AppColors.cardColor`.
  final Color? color;

  ///If `false`, removes the shadow added on default.
  final bool addShadow;

  ///Requires a child to display inside the card.
  final Widget child;

  ///`height` and `width` of the card.
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        route!,
        arguments: argument,
      ),
      // onTap: () => print(argument.toString()),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? AppColors.cardColor,
          boxShadow: [
            if (addShadow != false)
              BoxShadow(
                color: AppColors.dark25,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0.4,
              ),
          ],
        ),
        child: child,
      ),
    );
  }
}

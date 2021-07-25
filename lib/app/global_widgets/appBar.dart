import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class ETAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///Text to display at the center of the `AppBar`
  final title;

  ///Add a TabBar (if any)
  final TabBar? bottom;

  ///Set `hasLeading` to `false`, if the appBar doesnot have any leading `IconButton` - default value of `hasLeading` is `true`
  final bool hasLeading;

  ///Set `addBackButton` to `truee`, if the appBar has a BackButton as a leading `IconButton` - default value of `addBackButton` is `false`
  ///
  ///if `hasLeading` is `false`, but `addBackButton` is `true`, the `AppBar` has no leading giving priority to the `hasLeading` value.
  final bool addBackButton;

  final Size preferredSize;

  ///List of actions to display at the trailing end of the `AppBar`
  final List<Widget>? actions;

  ///Set the `addBackButton` to true
  ETAppBar({
    this.title,
    Key? key,
    this.bottom,
    this.actions,
    this.hasLeading = true,
    this.addBackButton = false,
  })  : preferredSize =
            Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0.0)),
        assert(!(!hasLeading && addBackButton),
            "'hasButton' is false but BackButton has been added."),
        super(key: key);

  Widget prefixIcon(BuildContext context) {
    if (!hasLeading) return Center();
    if (addBackButton)
      return IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: AppColors.dark80,
        ),
      );
    return IconButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: Icon(
        Icons.menu_sharp,
        color: AppColors.dark80,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (_) => prefixIcon(context),
      ),
      title: title != null
          ? Text(
              '$title',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 24.0),
            )
          : Center(),
      actions: [
        if (actions != null) ...actions!,
        SizedBox(
          width: 12,
        )
      ],
    );
  }
}

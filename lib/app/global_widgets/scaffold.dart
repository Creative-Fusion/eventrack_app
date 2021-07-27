import 'package:eventrack_app/app/global_widgets/appBar.dart';
import 'package:flutter/material.dart';

class ETScaffold extends StatelessWidget {
  ETScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  final Widget body;
  final ETAppBar? appBar;
  final Drawer? drawer;
  final bool resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child:Scaffold(
          appBar: appBar,
          drawer: drawer,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body:  body,
          ),
    );
  }
}
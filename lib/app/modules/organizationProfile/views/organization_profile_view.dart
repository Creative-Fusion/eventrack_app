import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/draggableSheet.dart';
import '../../../utilities/colors.dart';
import '../controllers/organization_profile_controller.dart';
import 'tabs/tab1.dart';
import 'tabs/tab2.dart';

class OrganizationProfileView extends GetView<OrganizationProfileController> {
  final controller = Get.find<OrganizationProfileController>();

  //TODO: create event button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ETAppBar(
        addBackButton: true,
        actions: [
          IconButton(
            onPressed: controller.pickProfile,
            iconSize: 20,
            icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.dark10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.camera_alt,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.42,
              decoration: BoxDecoration(
                image: controller.orgData.profile != null
                    ? DecorationImage(
                        image: NetworkImage(controller.orgData.profile!),
                        fit: BoxFit.cover,
                      )
                    : null,
                gradient: AppColors.imageGradient(),
              ),
              child: controller.orgData.profile == null
                  ? Center(
                      child: Text(
                        controller.orgData.name!,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline1!
                            .copyWith(color: AppColors.dark80),
                      ).paddingAll(20),
                    )
                  : Center(),
            ),
            DraggableSheet(
              tabIcons: [
                Icons.event_note,
                Icons.view_list,
              ],
              tabs: [
                OrganizationProfileTab1(),
                OrganizationProfileTab2(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

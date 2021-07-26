import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../../../models/event/event.dart';
import '../../../models/user/user.dart';
import '../../../models/response.dart';
import '../../../temp_data.dart';
import '../provider/event_detail_provider.dart';
import '../provider/event_detail_provider_impl.dart';
import '../../../global_widgets/message.dart';

class EventDetailController extends GetxController {
  final RxBool showMore = false.obs;
  late GoogleMapController? mapController;
  // late GlobalController globalController;
  late EventDetailProvider _eventDetailProvider;

  Event get event => TempData.event;
  //TODO: get.arguments garne

  // get users => TempData.users;
  late TextEditingController searchText;
  late RxList<User> partcipantList;

  @override
  void onInit() {
    searchText = TextEditingController();
    // globalController = Get.find<GlobalController>();
    _eventDetailProvider = Get.find<EventDetailProviderImpl>();
    partcipantList = <User>[].obs;
    super.onInit();
  }

  registerforevent() async {
    try {
      ResponseModel? register =
          await _eventDetailProvider.registerToEvent(event.id!);
      //this result is already parsed and is converted to List<Events>
      if (register!.state) {
        print("User registered");
        FlashMessage(register.state,
            message: register.message, displayOnSuccess: true);
      } else {
        print("Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  getParticipantsData() async {
    try {
      ResponseModel? participants =
          await _eventDetailProvider.getParticipants(event.id!);
      //this result is already parsed and is converted to List<Events>
      if (participants!.state) {
        print("Users data found");
        partcipantList.value = participants.userList!;
      } else {
        print("Users Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  void search() {
    print('Search for ${searchText.text}');
  }

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }
}

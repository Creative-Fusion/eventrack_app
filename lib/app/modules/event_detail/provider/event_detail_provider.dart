import '../../../models/response.dart';

abstract class EventDetailProvider {
  Future<ResponseModel?> registerToEvent(String id);
  Future<ResponseModel?> getParticipants(String id);
}
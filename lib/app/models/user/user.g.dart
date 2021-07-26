// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String?,
    profileImage: json['profileImage'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    gender: json['gender'] as String?,
    organization: json['organization'] as String?,
    isVerified: json['hasVerifiedEmail'] as bool?,
    blockStatus: json['blockStatus'] == null
        ? null
        : BlockStatus.fromJson(json['blockStatus'] as Map<String, dynamic>),
    registeredEvents: (json['registeredEvents'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    favourites: (json['favourites'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('profileImage', instance.profileImage);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('organization', instance.organization);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  writeNotNull('gender', instance.gender);
  writeNotNull('hasVerifiedEmail', instance.isVerified);
  writeNotNull('registeredEvents', instance.registeredEvents);
  writeNotNull('favourites', instance.favourites);
  writeNotNull('blockStatus', instance.blockStatus?.toJson());
  return val;
}

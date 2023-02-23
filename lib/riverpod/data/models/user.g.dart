// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_User',
      json,
      ($checkedConvert) {
        final val = _$_User(
          profileImageUrl:
              $checkedConvert('profile_image_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'profileImageUrl': 'profile_image_url'},
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'profile_image_url': instance.profileImageUrl,
    };

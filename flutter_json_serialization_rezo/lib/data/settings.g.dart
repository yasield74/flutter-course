// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      isPremium: json['is-premium'] as bool,
      themeColors: (json['theme-colors'] as List<dynamic>)
          .map((e) => const ColorConverter().fromJson(e as int))
          .toList(),
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'is-premium': instance.isPremium,
      'theme-colors':
          instance.themeColors.map(const ColorConverter().toJson).toList(),
    };

import 'package:flutter_json_serialization_rezo/data/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  const Settings._();

  const factory Settings(
      {required User user,
      required bool isPremium,
      @ColorConverter() required List<Color> themeColors}) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toDatabaseJson() {
    final json = toJson();
    json['timestamp'] = DateTime.now();
    return json;
  }
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();
  @override
  Color fromJson(int json) => Color(json);
  @override
  int toJson(Color object) => object.value;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'randomizer_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RandomizerState {
  int get min => throw _privateConstructorUsedError;
  dynamic get max => throw _privateConstructorUsedError;
  int? get generatedNumer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RandomizerStateCopyWith<RandomizerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomizerStateCopyWith<$Res> {
  factory $RandomizerStateCopyWith(
          RandomizerState value, $Res Function(RandomizerState) then) =
      _$RandomizerStateCopyWithImpl<$Res, RandomizerState>;
  @useResult
  $Res call({int min, dynamic max, int? generatedNumer});
}

/// @nodoc
class _$RandomizerStateCopyWithImpl<$Res, $Val extends RandomizerState>
    implements $RandomizerStateCopyWith<$Res> {
  _$RandomizerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = freezed,
    Object? generatedNumer = freezed,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as dynamic,
      generatedNumer: freezed == generatedNumer
          ? _value.generatedNumer
          : generatedNumer // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RandomizerStateImplCopyWith<$Res>
    implements $RandomizerStateCopyWith<$Res> {
  factory _$$RandomizerStateImplCopyWith(_$RandomizerStateImpl value,
          $Res Function(_$RandomizerStateImpl) then) =
      __$$RandomizerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, dynamic max, int? generatedNumer});
}

/// @nodoc
class __$$RandomizerStateImplCopyWithImpl<$Res>
    extends _$RandomizerStateCopyWithImpl<$Res, _$RandomizerStateImpl>
    implements _$$RandomizerStateImplCopyWith<$Res> {
  __$$RandomizerStateImplCopyWithImpl(
      _$RandomizerStateImpl _value, $Res Function(_$RandomizerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = freezed,
    Object? generatedNumer = freezed,
  }) {
    return _then(_$RandomizerStateImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: freezed == max ? _value.max! : max,
      generatedNumer: freezed == generatedNumer
          ? _value.generatedNumer
          : generatedNumer // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RandomizerStateImpl extends _RandomizerState
    with DiagnosticableTreeMixin {
  const _$RandomizerStateImpl({this.min = 0, this.max = 0, this.generatedNumer})
      : super._();

  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final dynamic max;
  @override
  final int? generatedNumer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RandomizerState(min: $min, max: $max, generatedNumer: $generatedNumer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RandomizerState'))
      ..add(DiagnosticsProperty('min', min))
      ..add(DiagnosticsProperty('max', max))
      ..add(DiagnosticsProperty('generatedNumer', generatedNumer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomizerStateImpl &&
            (identical(other.min, min) || other.min == min) &&
            const DeepCollectionEquality().equals(other.max, max) &&
            (identical(other.generatedNumer, generatedNumer) ||
                other.generatedNumer == generatedNumer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min,
      const DeepCollectionEquality().hash(max), generatedNumer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RandomizerStateImplCopyWith<_$RandomizerStateImpl> get copyWith =>
      __$$RandomizerStateImplCopyWithImpl<_$RandomizerStateImpl>(
          this, _$identity);
}

abstract class _RandomizerState extends RandomizerState {
  const factory _RandomizerState(
      {final int min,
      final dynamic max,
      final int? generatedNumer}) = _$RandomizerStateImpl;
  const _RandomizerState._() : super._();

  @override
  int get min;
  @override
  dynamic get max;
  @override
  int? get generatedNumer;
  @override
  @JsonKey(ignore: true)
  _$$RandomizerStateImplCopyWith<_$RandomizerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_marker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CollectionMarkerEvent {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude) markerProvider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? markerProvider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? markerProvider,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MarkerProvider value) markerProvider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarkerProvider value)? markerProvider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarkerProvider value)? markerProvider,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollectionMarkerEventCopyWith<CollectionMarkerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionMarkerEventCopyWith<$Res> {
  factory $CollectionMarkerEventCopyWith(CollectionMarkerEvent value,
          $Res Function(CollectionMarkerEvent) then) =
      _$CollectionMarkerEventCopyWithImpl<$Res, CollectionMarkerEvent>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$CollectionMarkerEventCopyWithImpl<$Res,
        $Val extends CollectionMarkerEvent>
    implements $CollectionMarkerEventCopyWith<$Res> {
  _$CollectionMarkerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkerProviderImplCopyWith<$Res>
    implements $CollectionMarkerEventCopyWith<$Res> {
  factory _$$MarkerProviderImplCopyWith(_$MarkerProviderImpl value,
          $Res Function(_$MarkerProviderImpl) then) =
      __$$MarkerProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$MarkerProviderImplCopyWithImpl<$Res>
    extends _$CollectionMarkerEventCopyWithImpl<$Res, _$MarkerProviderImpl>
    implements _$$MarkerProviderImplCopyWith<$Res> {
  __$$MarkerProviderImplCopyWithImpl(
      _$MarkerProviderImpl _value, $Res Function(_$MarkerProviderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$MarkerProviderImpl(
      null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MarkerProviderImpl implements MarkerProvider {
  const _$MarkerProviderImpl(this.latitude, this.longitude);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'CollectionMarkerEvent.markerProvider(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerProviderImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerProviderImplCopyWith<_$MarkerProviderImpl> get copyWith =>
      __$$MarkerProviderImplCopyWithImpl<_$MarkerProviderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude) markerProvider,
  }) {
    return markerProvider(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? markerProvider,
  }) {
    return markerProvider?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? markerProvider,
    required TResult orElse(),
  }) {
    if (markerProvider != null) {
      return markerProvider(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MarkerProvider value) markerProvider,
  }) {
    return markerProvider(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarkerProvider value)? markerProvider,
  }) {
    return markerProvider?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarkerProvider value)? markerProvider,
    required TResult orElse(),
  }) {
    if (markerProvider != null) {
      return markerProvider(this);
    }
    return orElse();
  }
}

abstract class MarkerProvider implements CollectionMarkerEvent {
  const factory MarkerProvider(final double latitude, final double longitude) =
      _$MarkerProviderImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$MarkerProviderImplCopyWith<_$MarkerProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CollectionMarkerState {
  Set<Marker> get marker => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollectionMarkerStateCopyWith<CollectionMarkerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionMarkerStateCopyWith<$Res> {
  factory $CollectionMarkerStateCopyWith(CollectionMarkerState value,
          $Res Function(CollectionMarkerState) then) =
      _$CollectionMarkerStateCopyWithImpl<$Res, CollectionMarkerState>;
  @useResult
  $Res call({Set<Marker> marker});
}

/// @nodoc
class _$CollectionMarkerStateCopyWithImpl<$Res,
        $Val extends CollectionMarkerState>
    implements $CollectionMarkerStateCopyWith<$Res> {
  _$CollectionMarkerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
  }) {
    return _then(_value.copyWith(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionMarkerStateImplCopyWith<$Res>
    implements $CollectionMarkerStateCopyWith<$Res> {
  factory _$$CollectionMarkerStateImplCopyWith(
          _$CollectionMarkerStateImpl value,
          $Res Function(_$CollectionMarkerStateImpl) then) =
      __$$CollectionMarkerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Marker> marker});
}

/// @nodoc
class __$$CollectionMarkerStateImplCopyWithImpl<$Res>
    extends _$CollectionMarkerStateCopyWithImpl<$Res,
        _$CollectionMarkerStateImpl>
    implements _$$CollectionMarkerStateImplCopyWith<$Res> {
  __$$CollectionMarkerStateImplCopyWithImpl(_$CollectionMarkerStateImpl _value,
      $Res Function(_$CollectionMarkerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
  }) {
    return _then(_$CollectionMarkerStateImpl(
      marker: null == marker
          ? _value._marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

/// @nodoc

class _$CollectionMarkerStateImpl implements _CollectionMarkerState {
  const _$CollectionMarkerStateImpl({required final Set<Marker> marker})
      : _marker = marker;

  final Set<Marker> _marker;
  @override
  Set<Marker> get marker {
    if (_marker is EqualUnmodifiableSetView) return _marker;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_marker);
  }

  @override
  String toString() {
    return 'CollectionMarkerState(marker: $marker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionMarkerStateImpl &&
            const DeepCollectionEquality().equals(other._marker, _marker));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_marker));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionMarkerStateImplCopyWith<_$CollectionMarkerStateImpl>
      get copyWith => __$$CollectionMarkerStateImplCopyWithImpl<
          _$CollectionMarkerStateImpl>(this, _$identity);
}

abstract class _CollectionMarkerState implements CollectionMarkerState {
  const factory _CollectionMarkerState({required final Set<Marker> marker}) =
      _$CollectionMarkerStateImpl;

  @override
  Set<Marker> get marker;
  @override
  @JsonKey(ignore: true)
  _$$CollectionMarkerStateImplCopyWith<_$CollectionMarkerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

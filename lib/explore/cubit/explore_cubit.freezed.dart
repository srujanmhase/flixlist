// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'explore_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExploreState {
  List<MovieList> get lists => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreStateCopyWith<ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreStateCopyWith<$Res> {
  factory $ExploreStateCopyWith(
          ExploreState value, $Res Function(ExploreState) then) =
      _$ExploreStateCopyWithImpl<$Res>;
  $Res call({List<MovieList> lists, String? error, bool isLoading});
}

/// @nodoc
class _$ExploreStateCopyWithImpl<$Res> implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._value, this._then);

  final ExploreState _value;
  // ignore: unused_field
  final $Res Function(ExploreState) _then;

  @override
  $Res call({
    Object? lists = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      lists: lists == freezed
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<MovieList>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ExploreStateCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory _$$_ExploreStateCopyWith(
          _$_ExploreState value, $Res Function(_$_ExploreState) then) =
      __$$_ExploreStateCopyWithImpl<$Res>;
  @override
  $Res call({List<MovieList> lists, String? error, bool isLoading});
}

/// @nodoc
class __$$_ExploreStateCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res>
    implements _$$_ExploreStateCopyWith<$Res> {
  __$$_ExploreStateCopyWithImpl(
      _$_ExploreState _value, $Res Function(_$_ExploreState) _then)
      : super(_value, (v) => _then(v as _$_ExploreState));

  @override
  _$_ExploreState get _value => super._value as _$_ExploreState;

  @override
  $Res call({
    Object? lists = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_ExploreState(
      lists: lists == freezed
          ? _value._lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<MovieList>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ExploreState implements _ExploreState {
  const _$_ExploreState(
      {final List<MovieList> lists = const <MovieList>[],
      this.error,
      this.isLoading = false})
      : _lists = lists;

  final List<MovieList> _lists;
  @override
  @JsonKey()
  List<MovieList> get lists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lists);
  }

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ExploreState(lists: $lists, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExploreState &&
            const DeepCollectionEquality().equals(other._lists, _lists) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lists),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_ExploreStateCopyWith<_$_ExploreState> get copyWith =>
      __$$_ExploreStateCopyWithImpl<_$_ExploreState>(this, _$identity);
}

abstract class _ExploreState implements ExploreState {
  const factory _ExploreState(
      {final List<MovieList> lists,
      final String? error,
      final bool isLoading}) = _$_ExploreState;

  @override
  List<MovieList> get lists;
  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ExploreStateCopyWith<_$_ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}

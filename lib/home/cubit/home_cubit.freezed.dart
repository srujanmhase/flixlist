// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<MovieList> get yourLists => throw _privateConstructorUsedError;
  MovieList? get featuredList => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<MovieList> yourLists,
      MovieList? featuredList,
      String? error});

  $MovieListCopyWith<$Res>? get featuredList;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? yourLists = freezed,
    Object? featuredList = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      yourLists: yourLists == freezed
          ? _value.yourLists
          : yourLists // ignore: cast_nullable_to_non_nullable
              as List<MovieList>,
      featuredList: featuredList == freezed
          ? _value.featuredList
          : featuredList // ignore: cast_nullable_to_non_nullable
              as MovieList?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $MovieListCopyWith<$Res>? get featuredList {
    if (_value.featuredList == null) {
      return null;
    }

    return $MovieListCopyWith<$Res>(_value.featuredList!, (value) {
      return _then(_value.copyWith(featuredList: value));
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<MovieList> yourLists,
      MovieList? featuredList,
      String? error});

  @override
  $MovieListCopyWith<$Res>? get featuredList;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? yourLists = freezed,
    Object? featuredList = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_HomeState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      yourLists: yourLists == freezed
          ? _value._yourLists
          : yourLists // ignore: cast_nullable_to_non_nullable
              as List<MovieList>,
      featuredList: featuredList == freezed
          ? _value.featuredList
          : featuredList // ignore: cast_nullable_to_non_nullable
              as MovieList?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.isLoading = false,
      final List<MovieList> yourLists = const <MovieList>[],
      this.featuredList,
      this.error})
      : _yourLists = yourLists;

  @override
  @JsonKey()
  final bool isLoading;
  final List<MovieList> _yourLists;
  @override
  @JsonKey()
  List<MovieList> get yourLists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yourLists);
  }

  @override
  final MovieList? featuredList;
  @override
  final String? error;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, yourLists: $yourLists, featuredList: $featuredList, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._yourLists, _yourLists) &&
            const DeepCollectionEquality()
                .equals(other.featuredList, featuredList) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_yourLists),
      const DeepCollectionEquality().hash(featuredList),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final bool isLoading,
      final List<MovieList> yourLists,
      final MovieList? featuredList,
      final String? error}) = _$_HomeState;

  @override
  bool get isLoading;
  @override
  List<MovieList> get yourLists;
  @override
  MovieList? get featuredList;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

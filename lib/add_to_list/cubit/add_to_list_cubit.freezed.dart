// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_to_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddToListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<MovieList> get yourLists => throw _privateConstructorUsedError;
  bool get movieAdded => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToListStateCopyWith<AddToListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToListStateCopyWith<$Res> {
  factory $AddToListStateCopyWith(
          AddToListState value, $Res Function(AddToListState) then) =
      _$AddToListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<MovieList> yourLists,
      bool movieAdded,
      String? error});
}

/// @nodoc
class _$AddToListStateCopyWithImpl<$Res>
    implements $AddToListStateCopyWith<$Res> {
  _$AddToListStateCopyWithImpl(this._value, this._then);

  final AddToListState _value;
  // ignore: unused_field
  final $Res Function(AddToListState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? yourLists = freezed,
    Object? movieAdded = freezed,
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
      movieAdded: movieAdded == freezed
          ? _value.movieAdded
          : movieAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddToListStateCopyWith<$Res>
    implements $AddToListStateCopyWith<$Res> {
  factory _$$_AddToListStateCopyWith(
          _$_AddToListState value, $Res Function(_$_AddToListState) then) =
      __$$_AddToListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<MovieList> yourLists,
      bool movieAdded,
      String? error});
}

/// @nodoc
class __$$_AddToListStateCopyWithImpl<$Res>
    extends _$AddToListStateCopyWithImpl<$Res>
    implements _$$_AddToListStateCopyWith<$Res> {
  __$$_AddToListStateCopyWithImpl(
      _$_AddToListState _value, $Res Function(_$_AddToListState) _then)
      : super(_value, (v) => _then(v as _$_AddToListState));

  @override
  _$_AddToListState get _value => super._value as _$_AddToListState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? yourLists = freezed,
    Object? movieAdded = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_AddToListState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      yourLists: yourLists == freezed
          ? _value._yourLists
          : yourLists // ignore: cast_nullable_to_non_nullable
              as List<MovieList>,
      movieAdded: movieAdded == freezed
          ? _value.movieAdded
          : movieAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddToListState implements _AddToListState {
  const _$_AddToListState(
      {this.isLoading = false,
      final List<MovieList> yourLists = const <MovieList>[],
      this.movieAdded = false,
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
  @JsonKey()
  final bool movieAdded;
  @override
  final String? error;

  @override
  String toString() {
    return 'AddToListState(isLoading: $isLoading, yourLists: $yourLists, movieAdded: $movieAdded, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToListState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._yourLists, _yourLists) &&
            const DeepCollectionEquality()
                .equals(other.movieAdded, movieAdded) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_yourLists),
      const DeepCollectionEquality().hash(movieAdded),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_AddToListStateCopyWith<_$_AddToListState> get copyWith =>
      __$$_AddToListStateCopyWithImpl<_$_AddToListState>(this, _$identity);
}

abstract class _AddToListState implements AddToListState {
  const factory _AddToListState(
      {final bool isLoading,
      final List<MovieList> yourLists,
      final bool movieAdded,
      final String? error}) = _$_AddToListState;

  @override
  bool get isLoading;
  @override
  List<MovieList> get yourLists;
  @override
  bool get movieAdded;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_AddToListStateCopyWith<_$_AddToListState> get copyWith =>
      throw _privateConstructorUsedError;
}

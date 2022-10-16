// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieList _$MovieListFromJson(Map<String, dynamic> json) {
  return _MovieList.fromJson(json);
}

/// @nodoc
mixin _$MovieList {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;
  List<Movie>? get movies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListCopyWith<MovieList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListCopyWith<$Res> {
  factory $MovieListCopyWith(MovieList value, $Res Function(MovieList) then) =
      _$MovieListCopyWithImpl<$Res>;
  $Res call({String uuid, String title, bool private, List<Movie>? movies});
}

/// @nodoc
class _$MovieListCopyWithImpl<$Res> implements $MovieListCopyWith<$Res> {
  _$MovieListCopyWithImpl(this._value, this._then);

  final MovieList _value;
  // ignore: unused_field
  final $Res Function(MovieList) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? title = freezed,
    Object? private = freezed,
    Object? movies = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieListCopyWith<$Res> implements $MovieListCopyWith<$Res> {
  factory _$$_MovieListCopyWith(
          _$_MovieList value, $Res Function(_$_MovieList) then) =
      __$$_MovieListCopyWithImpl<$Res>;
  @override
  $Res call({String uuid, String title, bool private, List<Movie>? movies});
}

/// @nodoc
class __$$_MovieListCopyWithImpl<$Res> extends _$MovieListCopyWithImpl<$Res>
    implements _$$_MovieListCopyWith<$Res> {
  __$$_MovieListCopyWithImpl(
      _$_MovieList _value, $Res Function(_$_MovieList) _then)
      : super(_value, (v) => _then(v as _$_MovieList));

  @override
  _$_MovieList get _value => super._value as _$_MovieList;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? title = freezed,
    Object? private = freezed,
    Object? movies = freezed,
  }) {
    return _then(_$_MovieList(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieList implements _MovieList {
  const _$_MovieList(
      {required this.uuid,
      required this.title,
      required this.private,
      final List<Movie>? movies})
      : _movies = movies;

  factory _$_MovieList.fromJson(Map<String, dynamic> json) =>
      _$$_MovieListFromJson(json);

  @override
  final String uuid;
  @override
  final String title;
  @override
  final bool private;
  final List<Movie>? _movies;
  @override
  List<Movie>? get movies {
    final value = _movies;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovieList(uuid: $uuid, title: $title, private: $private, movies: $movies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieList &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.private, private) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(private),
      const DeepCollectionEquality().hash(_movies));

  @JsonKey(ignore: true)
  @override
  _$$_MovieListCopyWith<_$_MovieList> get copyWith =>
      __$$_MovieListCopyWithImpl<_$_MovieList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieListToJson(
      this,
    );
  }
}

abstract class _MovieList implements MovieList {
  const factory _MovieList(
      {required final String uuid,
      required final String title,
      required final bool private,
      final List<Movie>? movies}) = _$_MovieList;

  factory _MovieList.fromJson(Map<String, dynamic> json) =
      _$_MovieList.fromJson;

  @override
  String get uuid;
  @override
  String get title;
  @override
  bool get private;
  @override
  List<Movie>? get movies;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListCopyWith<_$_MovieList> get copyWith =>
      throw _privateConstructorUsedError;
}

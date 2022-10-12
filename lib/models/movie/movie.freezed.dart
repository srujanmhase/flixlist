// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  String get Title => throw _privateConstructorUsedError;
  String get Year => throw _privateConstructorUsedError;
  String get Plot => throw _privateConstructorUsedError;
  String get Poster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res>;
  $Res call({String Title, String Year, String Plot, String Poster});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  final Movie _value;
  // ignore: unused_field
  final $Res Function(Movie) _then;

  @override
  $Res call({
    Object? Title = freezed,
    Object? Year = freezed,
    Object? Plot = freezed,
    Object? Poster = freezed,
  }) {
    return _then(_value.copyWith(
      Title: Title == freezed
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      Year: Year == freezed
          ? _value.Year
          : Year // ignore: cast_nullable_to_non_nullable
              as String,
      Plot: Plot == freezed
          ? _value.Plot
          : Plot // ignore: cast_nullable_to_non_nullable
              as String,
      Poster: Poster == freezed
          ? _value.Poster
          : Poster // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$_MovieCopyWith(_$_Movie value, $Res Function(_$_Movie) then) =
      __$$_MovieCopyWithImpl<$Res>;
  @override
  $Res call({String Title, String Year, String Plot, String Poster});
}

/// @nodoc
class __$$_MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res>
    implements _$$_MovieCopyWith<$Res> {
  __$$_MovieCopyWithImpl(_$_Movie _value, $Res Function(_$_Movie) _then)
      : super(_value, (v) => _then(v as _$_Movie));

  @override
  _$_Movie get _value => super._value as _$_Movie;

  @override
  $Res call({
    Object? Title = freezed,
    Object? Year = freezed,
    Object? Plot = freezed,
    Object? Poster = freezed,
  }) {
    return _then(_$_Movie(
      Title: Title == freezed
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      Year: Year == freezed
          ? _value.Year
          : Year // ignore: cast_nullable_to_non_nullable
              as String,
      Plot: Plot == freezed
          ? _value.Plot
          : Plot // ignore: cast_nullable_to_non_nullable
              as String,
      Poster: Poster == freezed
          ? _value.Poster
          : Poster // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie implements _Movie {
  const _$_Movie(
      {required this.Title,
      required this.Year,
      required this.Plot,
      required this.Poster});

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$$_MovieFromJson(json);

  @override
  final String Title;
  @override
  final String Year;
  @override
  final String Plot;
  @override
  final String Poster;

  @override
  String toString() {
    return 'Movie(Title: $Title, Year: $Year, Plot: $Plot, Poster: $Poster)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movie &&
            const DeepCollectionEquality().equals(other.Title, Title) &&
            const DeepCollectionEquality().equals(other.Year, Year) &&
            const DeepCollectionEquality().equals(other.Plot, Plot) &&
            const DeepCollectionEquality().equals(other.Poster, Poster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Title),
      const DeepCollectionEquality().hash(Year),
      const DeepCollectionEquality().hash(Plot),
      const DeepCollectionEquality().hash(Poster));

  @JsonKey(ignore: true)
  @override
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      __$$_MovieCopyWithImpl<_$_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required final String Title,
      required final String Year,
      required final String Plot,
      required final String Poster}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  String get Title;
  @override
  String get Year;
  @override
  String get Plot;
  @override
  String get Poster;
  @override
  @JsonKey(ignore: true)
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      throw _privateConstructorUsedError;
}

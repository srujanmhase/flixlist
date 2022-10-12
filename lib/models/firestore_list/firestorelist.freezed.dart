// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firestorelist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirestoreList _$FirestoreListFromJson(Map<String, dynamic> json) {
  return _FirestoreList.fromJson(json);
}

/// @nodoc
mixin _$FirestoreList {
  String get title => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;
  List<String> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreListCopyWith<FirestoreList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreListCopyWith<$Res> {
  factory $FirestoreListCopyWith(
          FirestoreList value, $Res Function(FirestoreList) then) =
      _$FirestoreListCopyWithImpl<$Res>;
  $Res call({String title, bool private, List<String> list});
}

/// @nodoc
class _$FirestoreListCopyWithImpl<$Res>
    implements $FirestoreListCopyWith<$Res> {
  _$FirestoreListCopyWithImpl(this._value, this._then);

  final FirestoreList _value;
  // ignore: unused_field
  final $Res Function(FirestoreList) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? private = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_FirestoreListCopyWith<$Res>
    implements $FirestoreListCopyWith<$Res> {
  factory _$$_FirestoreListCopyWith(
          _$_FirestoreList value, $Res Function(_$_FirestoreList) then) =
      __$$_FirestoreListCopyWithImpl<$Res>;
  @override
  $Res call({String title, bool private, List<String> list});
}

/// @nodoc
class __$$_FirestoreListCopyWithImpl<$Res>
    extends _$FirestoreListCopyWithImpl<$Res>
    implements _$$_FirestoreListCopyWith<$Res> {
  __$$_FirestoreListCopyWithImpl(
      _$_FirestoreList _value, $Res Function(_$_FirestoreList) _then)
      : super(_value, (v) => _then(v as _$_FirestoreList));

  @override
  _$_FirestoreList get _value => super._value as _$_FirestoreList;

  @override
  $Res call({
    Object? title = freezed,
    Object? private = freezed,
    Object? list = freezed,
  }) {
    return _then(_$_FirestoreList(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirestoreList implements _FirestoreList {
  const _$_FirestoreList(
      {required this.title,
      required this.private,
      required final List<String> list})
      : _list = list;

  factory _$_FirestoreList.fromJson(Map<String, dynamic> json) =>
      _$$_FirestoreListFromJson(json);

  @override
  final String title;
  @override
  final bool private;
  final List<String> _list;
  @override
  List<String> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'FirestoreList(title: $title, private: $private, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirestoreList &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.private, private) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(private),
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  _$$_FirestoreListCopyWith<_$_FirestoreList> get copyWith =>
      __$$_FirestoreListCopyWithImpl<_$_FirestoreList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirestoreListToJson(
      this,
    );
  }
}

abstract class _FirestoreList implements FirestoreList {
  const factory _FirestoreList(
      {required final String title,
      required final bool private,
      required final List<String> list}) = _$_FirestoreList;

  factory _FirestoreList.fromJson(Map<String, dynamic> json) =
      _$_FirestoreList.fromJson;

  @override
  String get title;
  @override
  bool get private;
  @override
  List<String> get list;
  @override
  @JsonKey(ignore: true)
  _$$_FirestoreListCopyWith<_$_FirestoreList> get copyWith =>
      throw _privateConstructorUsedError;
}

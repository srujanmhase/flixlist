import 'package:bloc/bloc.dart';
import 'package:flixlist/models/list/list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> fetchHomeData() async {}
}

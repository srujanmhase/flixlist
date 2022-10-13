import 'package:bloc/bloc.dart';
import 'package:flixlist/models/list/list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_state.dart';
part 'explore_cubit.freezed.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState());

  Future<void> fetchExplorePage() async {}
}

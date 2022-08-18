import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/home_model.dart';
import '../../services/api_controller.dart';
import '../../utils/app_resource/string_resources.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeData>(_getHomeData);
  }

  void _getHomeData(GetHomeData getHomeData, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      HomeResponse? homeResponse;
      Map<String, dynamic> param;
      param = {"params": {}};
      homeResponse = await ApiController().getHomeData(param: param);
      print(homeResponse);
      emit(HomeSuccess(homeResponse: homeResponse!));
    } catch (e) {
      emit(const HomeFailure(message: StringRes.someThingWentWrong));
    }
  }
}

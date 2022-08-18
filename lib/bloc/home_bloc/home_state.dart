part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeSuccess extends HomeState {
  final HomeResponse homeResponse;

  const HomeSuccess({required this.homeResponse});
  @override
  List<Object?> get props => [];
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

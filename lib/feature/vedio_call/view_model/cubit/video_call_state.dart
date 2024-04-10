abstract class HomeCallIDState {}

class HomeCallIDInitialState extends HomeCallIDState {}

class HomeCallIDSuccessState extends HomeCallIDState {
  final String userName;
  final String callId;

  HomeCallIDSuccessState({required this.userName, required this.callId});
}

class HomeCallIDErrorState extends HomeCallIDState {
  final String message;

  HomeCallIDErrorState(this.message);
}

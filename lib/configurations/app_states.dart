abstract class AppStates {}

class InitialState extends AppStates {}
class LoadingState extends AppStates {
  String type;
  LoadingState({this.type = ""});
}
class LoadedState extends AppStates {
  final dynamic data;
  LoadedState(this.data);
}
class EmptyState extends AppStates {}
class ErrorState extends AppStates {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
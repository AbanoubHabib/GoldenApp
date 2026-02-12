part of 'silver_cubit.dart';

sealed class SilverState {}

final class SilverInitialState extends SilverState {}

final class SilverLoadingState extends SilverState {}

final class SilverSuccessState extends SilverState {
  final ItemModel silverModel;

  SilverSuccessState(this.silverModel);
}

final class SilverUpdateState extends SilverState {}

final class SilverErrorState extends SilverState {
  final String errorMessage;

  SilverErrorState(this.errorMessage);
}

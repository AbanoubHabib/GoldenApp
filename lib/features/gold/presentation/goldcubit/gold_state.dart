part of 'gold_cubit.dart';


sealed class GoldState {}

final class GoldInitialState extends GoldState {}

final class GoldLoadingState extends GoldState {}
final class GoldUpdateState extends GoldState {}

final class GoldErrorState extends GoldState {
  final String errorMessage;

  GoldErrorState(this.errorMessage);
}

final class GoldSuccessState extends GoldState {
  // The goldModel property holds the data retrieved or processed successfully.
  // The constructor initializes this property when the state is created
  final ItemModel goldModel;

  GoldSuccessState(this.goldModel);
}
//! GoldModel (defined in gold_model.dart) is the data shape only.
//! The repository (gold_repo / gold_repository.dart) fetches raw data (API/DB),
//! parses it into a GoldModel, and returns it. The cubit (gold_cubit.dart) calls the repository,
//! then emits GoldLoadingState, GoldSuccessState(goldModel), or GoldErrorState depending on the result.

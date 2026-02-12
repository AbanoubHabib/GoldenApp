import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/item_model.dart';
import '../../data/repo/item_repo.dart';
part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final ItemRepo goldRepo;
  GoldCubit(this.goldRepo) : super(GoldInitialState());

  Future<void> getGoldPrice() async {
    emit(GoldLoadingState());
    final result = await goldRepo.getGoldPrice();
    result.fold(
      (error) => emit(GoldErrorState(error)),
      (goldModel) => emit(GoldSuccessState(goldModel)),
    );
  }
}


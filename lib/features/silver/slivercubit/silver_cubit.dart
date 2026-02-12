import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldenprice/features/gold/data/repo/item_repo.dart';

import '../../gold/data/models/item_model.dart';

part 'silver_state.dart';

class SilverCubit extends Cubit<SilverState> {
  final ItemRepo sliverRepo ;
  SilverCubit(this.sliverRepo) : super(SilverInitialState());

  Future<void> getSilverPrice() async {
    emit(SilverLoadingState());
    final result = await sliverRepo.getSilverPrice();
    result.fold(
          (error) => emit(SilverErrorState(error)),
          (silverModel) => emit(SilverSuccessState(silverModel)),
    );
  }
}

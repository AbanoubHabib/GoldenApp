import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, BlocBuilder, ReadContext;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldenprice/core/constants/app_colors.dart';
import 'package:goldenprice/features/gold/data/repo/item_repo.dart';
import 'package:goldenprice/features/gold/presentation/goldcubit/gold_cubit.dart';
import '../../../core/constants/app_assets.dart';
import '../../gold/presentation/widgets/custom_price_formated.dart';
import '../slivercubit/silver_cubit.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SilverCubit(ItemRepo())
        ..getSilverPrice(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 2,
          title: const Text(
            'Silver',
            style: TextStyle(
              color: AppColors.silverColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: AppColors.silverColor),
          actions: [
            BlocBuilder<SilverCubit, SilverState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context.read<SilverCubit>().getSilverPrice();
                    print('Refreshing silver price...');
                  },
                );
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, top: 100, right: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.gold3,
                  width: 150,
                  height: 300,
                  color: AppColors.silverColor,
                ),
                BlocBuilder<SilverCubit, SilverState>(
                  builder: (context, state) {
                    if (state is SilverLoadingState) {
                      return Center(
                        child: const CircularProgressIndicator(
                          color: AppColors.goldColor,
                        ),
                      );
                    } else if (state is SilverErrorState) {
                      return Text('Error: ${state.errorMessage}');
                    } else if (state is SilverSuccessState) {
                      return CustomPriceTextFormatted(
                        price: state.silverModel.price.toString(),
                        priceColor: AppColors.silverColor,
                        currencyColor: AppColors.silverColor,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

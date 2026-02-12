import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldenprice/core/constants/app_colors.dart';
import 'package:goldenprice/features/gold/data/repo/gold_repo.dart';
import 'package:goldenprice/features/gold/presentation/goldcubit/gold_cubit.dart';
import '../../../../core/constants/app_assets.dart';
import '../widgets/custom_price_formated.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..getGoldPrice(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 2,
          title: const Text(
            'Gold',
            style: TextStyle(
              color: AppColors.goldColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: AppColors.goldColor),
          actions: [
            IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
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
                SvgPicture.asset(AppAssets.gold3, width: 150, height: 300),
                BlocBuilder<GoldCubit, GoldState>(
                  builder: (context, state) {
                    if (state is GoldLoadingState) {
                      return Center(child: const CircularProgressIndicator(
                        color: AppColors.goldColor,
                      ));
                    } else if (state is GoldErrorState) {
                      return Text('Error: ${state.errorMessage}');
                    } else if (state is GoldSuccessState) {
                      return CustomPriceTextFormatted(
                        price: state.goldModel.price.toString(),
                        priceColor: AppColors.goldColor,
                        currencyColor: AppColors.goldColor,
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

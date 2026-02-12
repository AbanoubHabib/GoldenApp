import 'package:dartz/dartz.dart';
import 'package:goldenprice/core/api/api_constants.dart';
import 'package:goldenprice/core/api/dio_helper.dart';
import 'package:goldenprice/features/gold/data/models/gold_model.dart';

class GoldRepo {
  // Either from dartz package is a type that can hold one of two values:
  // a Left value (usually representing an error) or
  // a Right value (usually representing a success).
  Future<Either<String, GoldModel>> getGoldPrice() async {
    try {
      //! response is the all data that we get from the server
      final response = await DioHelper.getData(
          endPoint: ApiConstants.goldEndPoint);
      //! now we need to convert the response data to GoldModel
      final goldModel = GoldModel.fromJson(response.data);
      //! if the conversion is successful, we return the goldModel wrapped in a Right
      return Right(goldModel);
    }catch (e) {
      return Left(e.toString());
    }
  }


}

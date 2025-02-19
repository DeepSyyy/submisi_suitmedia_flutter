import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_test_submission/core/errors/failure.dart';
import 'package:suitmedia_test_submission/features/user_list/business/entity/main_entity.dart';
import 'package:suitmedia_test_submission/features/user_list/business/usecase/get_user.dart';
import 'package:suitmedia_test_submission/features/user_list/data/datasource/user_remote_data_source.dart';
import 'package:suitmedia_test_submission/features/user_list/data/repository/user_repository_impl.dart';

class ThirdScreenProvider extends ChangeNotifier {
  DataEntity? dataEntities;
  Failure? failure;

  ThirdScreenProvider({this.dataEntities, this.failure});

  void eitherFailureOrDataEntity({required int pageTotal}) async {
    try {
      UserRepostoryImpl repository = UserRepostoryImpl(
        remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),
      );
      final failureOrDataEntity = await GetUser(
        repository,
      ).call(pageTotal: pageTotal);
      failureOrDataEntity.fold(
        (failure) {
          this.failure = failure;
          notifyListeners();
        },
        (dataEntity) {
          dataEntities = dataEntity;
          failure = null;
          notifyListeners();
        },
      );
    } catch (e) {
      failure = ServerFailure(
        errorMessage: 'gagal mendapatkan data, karena $e',
      );
    }
  }
}

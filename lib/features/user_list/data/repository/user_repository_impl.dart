import 'package:dartz/dartz.dart';
import 'package:suitmedia_test_submission/core/errors/failure.dart';
import 'package:suitmedia_test_submission/features/user_list/business/repository/user_list_repository.dart';
import 'package:suitmedia_test_submission/features/user_list/data/datasource/user_remote_data_source.dart';
import 'package:suitmedia_test_submission/features/user_list/data/model/main_model.dart';

class UserRepostoryImpl implements UserListRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepostoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, DataModel>> getUser({required int pageTotal}) async {
    try {
      final result = await remoteDataSource.getUser(pageTotal: pageTotal);
      return Right(result);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: 'gagal mendapatkan data, karena $e'),
      );
    }
  }
}

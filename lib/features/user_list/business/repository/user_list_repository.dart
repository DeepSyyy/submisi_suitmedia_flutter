import 'package:dartz/dartz.dart';
import 'package:suitmedia_test_submission/core/errors/failure.dart';
import 'package:suitmedia_test_submission/features/user_list/business/entity/main_entity.dart';

abstract class UserListRepository {
  Future<Either<Failure, DataEntity>> getUser({required int pageTotal});
}

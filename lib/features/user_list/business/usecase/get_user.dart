import 'package:dartz/dartz.dart';
import 'package:suitmedia_test_submission/core/errors/failure.dart';
import 'package:suitmedia_test_submission/features/user_list/business/entity/main_entity.dart';
import 'package:suitmedia_test_submission/features/user_list/business/repository/user_list_repository.dart';

class GetUser {
  final UserListRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, DataEntity>> call({required int pageTotal}) async {
    return await repository.getUser(pageTotal: pageTotal);
  }
}

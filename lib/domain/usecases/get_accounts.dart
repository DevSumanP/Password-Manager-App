import 'package:password_manager/data/repositories/account_repository.dart';
import 'package:password_manager/domain/entities/account_entity.dart';

class GetAccount {
  final AccountRepository repository;

  GetAccount(this.repository);

  Future<List<AccountEntity>> getAllAccounts() async {
    return await repository.getAllAcounts();
  }

  Future<AccountEntity?> getAccountById(String id) async {
    return await repository.getAccountById(id);
  }
}

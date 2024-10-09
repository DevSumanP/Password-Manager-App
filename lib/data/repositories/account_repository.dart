import 'package:password_manager/domain/entities/account_entity.dart';

abstract class AccountRepository {
  Future<List<AccountEntity>> getAllAcounts();
  Future<AccountEntity?> getAccountById(String id);
  Future<void> addAccount(AccountEntity account);
  Future<void> deleteAccount(String id);
}

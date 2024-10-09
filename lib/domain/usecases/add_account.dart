import 'package:password_manager/data/repositories/account_repository.dart';
import 'package:password_manager/domain/entities/account_entity.dart';

class AddAccount {
  final AccountRepository repository;

  AddAccount(this.repository);

  Future<void> execute(AccountEntity account) async {
    await repository.addAccount(account);
  }
}

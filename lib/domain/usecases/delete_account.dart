import 'package:password_manager/data/repositories/account_repository.dart';

class DeleteAccount {
  final AccountRepository repository;

  DeleteAccount(this.repository);

  Future<void> execute(String id) async {
    await repository.deleteAccount(id);
  }
}

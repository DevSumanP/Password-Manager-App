import 'package:hive/hive.dart';

part 'account_model.g.dart';

@HiveType(typeId: 0)
class Account extends HiveObject {
  @HiveField(0)
  String serviceName;

  @HiveField(1)
  String serviceUrl;

  @HiveField(2)
  String password;

  @HiveField(3)
  String category;

  @HiveField(4)
  bool isPasswordVisible;

  Account({
    required this.serviceName,
    required this.serviceUrl,
    required this.password,
    required this.category,
    required this.isPasswordVisible,
  });
}

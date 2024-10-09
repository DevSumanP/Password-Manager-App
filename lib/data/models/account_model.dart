import 'package:password_manager/domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  AccountModel({
    required super.id,
    required super.serviceName,
    required super.serviceUrl,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serviceName': serviceName,
      'serviceUrl': serviceUrl,
      'password': password,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'],
      serviceName: map['serviceName'],
      serviceUrl: map['serviceUrl'],
      password: map['password'],
    );
  }
}

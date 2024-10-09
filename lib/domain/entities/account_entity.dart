class AccountEntity {
  final String id;
  final String serviceName;
  final String serviceUrl;
  final String password;

  AccountEntity({
    required this.id,
    required this.serviceUrl,
    required this.password,
    required this.serviceName,
  });
}

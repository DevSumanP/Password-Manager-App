// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 0;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      serviceName: fields[0] as String,
      serviceUrl: fields[1] as String,
      password: fields[2] as String,
      category: fields[3] as String,
      isPasswordVisible: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.serviceName)
      ..writeByte(1)
      ..write(obj.serviceUrl)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.isPasswordVisible);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

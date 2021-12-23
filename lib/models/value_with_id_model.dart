import 'package:equatable/equatable.dart';

class ValueWithIdModel extends Equatable {
  const ValueWithIdModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  final int id;
  final String nameAr;
  final String nameEn;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
    };
  }

  factory ValueWithIdModel.fromJson(Map<String, dynamic> map) {
    return ValueWithIdModel(
      id: map['id'] ?? 0,
      nameAr: map['name_ar'] ?? '',
      nameEn: map['name_en'] ?? '',
    );
  }

  @override
  String toString() => nameAr;

  @override
  List get props => [id];
}

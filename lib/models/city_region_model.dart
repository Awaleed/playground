import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  const CityModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.countryId,
  });

  final int id;
  final String nameAr;
  final String nameEn;
  final int countryId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'country_id': countryId,
    };
  }

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] ?? 0,
      nameAr: map['name_ar'] ?? '',
      nameEn: map['name_en'] ?? '',
      countryId: map['country_id'] ?? 0,
      // regions: map['regions'] == null ? [] : List.from(map['regions']).map((e) => RegionModel.fromJson(e)).toList(),
    );
  }

  @override
  String toString() => nameAr;

  @override
  List get props => [id];
}

class RegionModel extends Equatable {
  const RegionModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
  });

  final int id;
  final String nameAr;
  final String nameEn;
  final int cityId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'city_id': cityId,
    };
  }

  factory RegionModel.fromJson(Map<String, dynamic> map) {
    return RegionModel(
      id: map['id'] ?? 0,
      nameAr: map['name_ar'] ?? '',
      nameEn: map['name_en'] ?? '',
      cityId: map['city_id'] ?? 0,
    );
  }

  @override
  List get props => [id];

  @override
  String toString() => nameAr;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:playground/main.dart';

import 'city_region_model.dart';
import 'promotion_file_model.dart';
import 'value_with_id_model.dart';

part 'teacher_model.g.dart';

CollectionReference status =
    FirebaseFirestore.instance.collection('taleb_status');
CollectionReference localNotes =
    FirebaseFirestore.instance.collection('taleb_notes');

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TeacherModel {
  Future setFilterType(FilterType value) async {
    await status
        .doc('$id')
        .set({'value': EnumToString.convertToString(value)})
        .then(
            (value) => print("'full_name' & 'age' merged with existing data!"))
        .catchError((error) => print("Failed to merge data: $error"));
  }

  Future<FilterType?> get filterType {
    return status.doc('$id').get().then(
      (value) {
        final f = value.get('value') ??
            EnumToString.convertToString(FilterType.uncategorized);
        return EnumToString.fromString(FilterType.values, f.toString());
      },
    );
  }

  // String? get localNote {
  //   return localNotes[id];
  // }

  // set localNote(String? value) {
  //   localNotes[id] = value;
  // }

  double get profileCompletionPercentage =>
      (personalInfoCompletion.finishedFields /
          personalInfoCompletion.totalFieldsNumber);

  TeacherModel({
    this.promotionalFile,
    this.teachingGenderId,
    this.educationalLevels,
    required this.id,
    required this.appUserId,
    required this.commentsCount,
    required this.rating,
    this.nameAr,
    this.nameEn,
    this.img,
    this.accountPhone,
    this.accountEmail,
    this.phone,
    this.type,
    this.userType,
    this.experiance,
    this.longitude,
    this.latitude,
    this.attachments,
    this.onlineStatus,
    required this.hourPrice,
    required this.monthPrice,
    required this.onlineHourPrice,
    required this.onlineMonthPrice,
    required this.monthNumberOfHours,
    required this.onlineMonthNumberOfHours,
    this.detailsAr,
    this.detailsEn,
    this.city,
    required this.createdAt,
    // required this.availableDays,
    this.region,
    this.education,
    this.qualifications,
    this.subjects,
  });

  final int id;

  final int appUserId;
  final int commentsCount;
  final double rating;

  final PromotionFileModel? promotionalFile;

  final String? nameAr;
  final String? nameEn;
  final String? img;
  final String? accountPhone;
  final String? accountEmail;
  final String? phone;
  final int? type;
  final String? userType;
  final String? experiance;
  final String? longitude;
  final String? latitude;

  final int hourPrice;
  final int monthPrice;

  final int onlineHourPrice;
  final int onlineMonthPrice;

  final int monthNumberOfHours;
  final int onlineMonthNumberOfHours;

  final int? onlineStatus;
  final int? teachingGenderId;
  final String? detailsAr;
  final String? detailsEn;
  final DateTime createdAt;
  final CityModel? city;
  final RegionModel? region;
  final ValueWithIdModel? education;

  @JsonKey(ignore: true)
  String get name => nameAr ?? '';

  static List<String> qualificationsFromJson(dynamic value) {
    final list = <String>[];
    if (value is List) {
      list.addAll(value.map((e) => '$e').toList());
    }
    return list;
  }

  @JsonKey(name: 'qualify_id', fromJson: qualificationsFromJson)
  final List<String>? qualifications;
  final List<String>? attachments;

  static List<ValueWithIdModel> availableDaysFromJson(dynamic value) {
    final list = <ValueWithIdModel>[];
    if (value is List) {
      for (final item in value) {
        if (item is int) {
          list.add(getDays()[item - 1]);
        }
      }
    }
    return list;
  }

  // @JsonKey(name: 'available_days', fromJson: availableDaysFromJson)
  // final List<AvailableDayModel>? availableDays;
  final List<ValueWithIdModel>? subjects;
  final List<ValueWithIdModel>? educationalLevels;

  @JsonKey(ignore: true)
  LatLng? get location {
    if (latitude == null || longitude == null) return null;

    try {
      return LatLng(double.parse(latitude!), double.parse(longitude!));
    } catch (e) {
      return null;
    }
  }

  @JsonKey(ignore: true)
  String get searchableText => '$nameAr,$nameEn';

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);

  @JsonKey(ignore: true)
  ProfileCompletionModel get totalFields =>
      promotionalVideoCompletion +
      personalInfoCompletion +
      addressCompletion +
      aboutYourSelfCompletion;
  @JsonKey(ignore: true)
  ProfileCompletionModel get promotionalVideoCompletion =>
      ProfileCompletionModel(
          totalFieldsNumber: 1,
          finishedFields: promotionalFile == null ? 0 : 1);
  @JsonKey(ignore: true)
  ProfileCompletionModel get personalInfoCompletion => ProfileCompletionModel(
      totalFieldsNumber: 1, finishedFields: img == null ? 0 : 1);
  @JsonKey(ignore: true)
  ProfileCompletionModel get addressCompletion {
    int count = 0;
    int value = 0;
    if (city != null) value++;
    count++;
    if (region != null) value++;
    count++;
    if (longitude != null && latitude != null) value++;
    count++;

    return ProfileCompletionModel(
        totalFieldsNumber: count, finishedFields: value);
  }

  @JsonKey(ignore: true)
  ProfileCompletionModel get aboutYourSelfCompletion {
    int count = 0;
    int value = 0;

    if (experiance != null) value++;
    count++;
    if (qualifications != null && qualifications!.isNotEmpty) value++;
    count++;
    if (detailsAr != null) value++;
    count++;
    if (detailsEn != null) value++;
    count++;
    if (educationalLevels != null && educationalLevels!.isNotEmpty) value++;
    count++;
    if (education != null) value++;
    count++;
    if (subjects != null && subjects!.isNotEmpty) value++;
    count++;
    // if (availableDays != null && availableDays!.isNotEmpty) value++;
    // count++;
    if (teachingGenderId != null) value++;
    count++;
    if (hourPrice != 0 ||
        monthPrice != 0 ||
        onlineHourPrice != 0 ||
        onlineMonthPrice != 0) value++;
    count++;

    return ProfileCompletionModel(
        totalFieldsNumber: count, finishedFields: value);
  }

  bool search(String q) {
    return '''
    $nameAr
    $nameEn
    $detailsAr
    $detailsEn
    '''
        .contains(q);
  }
}

class ProfileCompletionModel {
  ProfileCompletionModel({
    required this.totalFieldsNumber,
    required this.finishedFields,
  });
  final int totalFieldsNumber;
  final int finishedFields;

  ProfileCompletionModel operator +(ProfileCompletionModel other) {
    return ProfileCompletionModel(
      finishedFields: finishedFields + other.finishedFields,
      totalFieldsNumber: totalFieldsNumber + other.totalFieldsNumber,
    );
  }
}

List<ValueWithIdModel> getDays() => [
      const ValueWithIdModel(id: 1, nameAr: 'saturday', nameEn: 'saturday'),
      const ValueWithIdModel(id: 2, nameAr: 'sunday', nameEn: 'sunday'),
      const ValueWithIdModel(id: 3, nameAr: 'monday', nameEn: 'monday'),
      const ValueWithIdModel(id: 4, nameAr: 'tuesday', nameEn: 'tuesday'),
      const ValueWithIdModel(id: 5, nameAr: 'wednesday', nameEn: 'wednesday'),
      const ValueWithIdModel(id: 6, nameAr: 'thursday', nameEn: 'thursday'),
      const ValueWithIdModel(id: 7, nameAr: 'friday', nameEn: 'friday'),
    ];

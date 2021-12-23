// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
      promotionalFile: json['promotional_file'] == null
          ? null
          : PromotionFileModel.fromJson(
              json['promotional_file'] as Map<String, dynamic>),
      teachingGenderId: json['teaching_gender_id'] as int?,
      educationalLevels: (json['educational_levels'] as List<dynamic>?)
          ?.map((e) => ValueWithIdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
      appUserId: json['app_user_id'] as int,
      commentsCount: json['comments_count'] as int,
      rating: (json['rating'] as num).toDouble(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      img: json['img'] as String?,
      accountPhone: json['account_phone'] as String?,
      accountEmail: json['account_email'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as int?,
      userType: json['user_type'] as String?,
      experiance: json['experiance'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      onlineStatus: json['online_status'] as int?,
      hourPrice: json['hour_price'] as int,
      monthPrice: json['month_price'] as int,
      onlineHourPrice: json['online_hour_price'] as int,
      onlineMonthPrice: json['online_month_price'] as int,
      monthNumberOfHours: json['month_number_of_hours'] as int,
      onlineMonthNumberOfHours: json['online_month_number_of_hours'] as int,
      detailsAr: json['details_ar'] as String?,
      detailsEn: json['details_en'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      region: json['region'] == null
          ? null
          : RegionModel.fromJson(json['region'] as Map<String, dynamic>),
      education: json['education'] == null
          ? null
          : ValueWithIdModel.fromJson(
              json['education'] as Map<String, dynamic>),
      qualifications: TeacherModel.qualificationsFromJson(json['qualify_id']),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => ValueWithIdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_user_id': instance.appUserId,
      'comments_count': instance.commentsCount,
      'rating': instance.rating,
      'promotional_file': instance.promotionalFile?.toJson(),
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'img': instance.img,
      'account_phone': instance.accountPhone,
      'account_email': instance.accountEmail,
      'phone': instance.phone,
      'type': instance.type,
      'user_type': instance.userType,
      'experiance': instance.experiance,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'hour_price': instance.hourPrice,
      'month_price': instance.monthPrice,
      'online_hour_price': instance.onlineHourPrice,
      'online_month_price': instance.onlineMonthPrice,
      'month_number_of_hours': instance.monthNumberOfHours,
      'online_month_number_of_hours': instance.onlineMonthNumberOfHours,
      'online_status': instance.onlineStatus,
      'teaching_gender_id': instance.teachingGenderId,
      'details_ar': instance.detailsAr,
      'details_en': instance.detailsEn,
      'created_at': instance.createdAt.toIso8601String(),
      'city': instance.city?.toJson(),
      'region': instance.region?.toJson(),
      'education': instance.education?.toJson(),
      'qualify_id': instance.qualifications,
      'attachments': instance.attachments,
      'subjects': instance.subjects?.map((e) => e.toJson()).toList(),
      'educational_levels':
          instance.educationalLevels?.map((e) => e.toJson()).toList(),
    };

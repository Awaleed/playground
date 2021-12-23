

class PromotionFileModel {
  PromotionFileModel({
    required this.type,
    required this.path,
    required this.status,
  });

  final int type;
  final String path;
  final int status;

  factory PromotionFileModel.fromJson(Map<String, dynamic> map) {
    return PromotionFileModel(
      type: map['type'],
      path: map['path'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'path': path,
      'status': status,
    };
  }
}

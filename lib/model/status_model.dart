class Status {
  Status({
    required this.success,
    required this.errorCode,
    required this.errorDescription,
  });

  bool success;
  int errorCode;
  String errorDescription;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        success: json["success"],
        errorCode: json["error_code"],
        errorDescription: json["error_description"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error_code": errorCode,
        "error_description": errorDescription,
      };
}

class Company {
  Company({this.name, this.image, this.id});

  String? name;
  String? image;
  int? id;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] == false ? "" : json["name"],
        image: json["image"] == false ? "" : json["image"],
        id: json["id"] == false ? "" : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

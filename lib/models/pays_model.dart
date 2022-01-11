class PaysModel {
  String? id;
  String? country;
  String? town;
  String? image;
  int? temperature;

  PaysModel({this.id, this.country, this.town, this.image, this.temperature});

  PaysModel.fromJsonMap(Map<String, dynamic> map)
      : id = map["_id"],
        country = map["country"],
        town = map["town"],
        image = map["image"],
        temperature = map["temperature"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['country'] = country;
    data['town'] = town;
    data['image'] = image;
    data['temperature'] = temperature;
    return data;
  }
}

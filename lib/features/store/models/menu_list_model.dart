class MenuListModel {
  final int pk;
  final String name;
  final String description;
  final int normalPrice;
  final int? disPrice;
  final int? count;

  MenuListModel({
    required this.pk,
    required this.name,
    required this.description,
    required this.normalPrice,
    required this.disPrice,
    required this.count,
  });

  MenuListModel.fromJson(Map<dynamic, dynamic> json)
      : pk = json["pk"],
        name = json["name"],
        description = json["description"],
        normalPrice = json["normalPrice"],
        disPrice = json["disPrice"],
        count = json["count"];
}

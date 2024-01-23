class MenuListModel {
  final int pk;
  final String name;
  final String description;
  final int normalPrice;
  final int? disPrice;

  MenuListModel({
    required this.pk,
    required this.name,
    required this.description,
    required this.normalPrice,
    required this.disPrice,
  });

  MenuListModel.fromJson(Map<dynamic, dynamic> json)
      : pk = json["pk"],
        name = json["name"],
        description = json["description"],
        normalPrice = json["normalPrice"],
        disPrice = json["disPrice"];
}

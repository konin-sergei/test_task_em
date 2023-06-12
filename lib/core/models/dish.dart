import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'tegs')
  final List<String> tags;


  Dish({required this.id, required this.name, required this.price, required this.weight, required this.description, required this.imageUrl, required this.tags});

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'dish.dart';

part 'dishes.g.dart';

@JsonSerializable()
///бесполезно. Зачем класс, в котором хранится только List<Dish>? Проще всегда использовать List<Dish> и все.
///А dishes.dishes это Франкентштейн. Не читаемо!
class Dishes {

  final List<Dish> dishes;

  Dishes({required this.dishes});

  factory Dishes.fromJson(Map<String, dynamic> json) => _$DishesFromJson(json);

  Map<String, dynamic> toJson() => _$DishesToJson(this);
}



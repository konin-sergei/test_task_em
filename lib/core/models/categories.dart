import 'package:json_annotation/json_annotation.dart';
import 'category.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {

  // Я так понимаю, в рамках тестового задания это намеренно было сделано.
  @JsonKey(name: 'сategories')
  final List<Category> categories;

  Categories({required this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}



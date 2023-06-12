abstract class CategoriesBaseEvent {}

class CategoriesGetEvent extends CategoriesBaseEvent {
  CategoriesGetEvent();
}

class CategoriesFailureLoadEvent extends CategoriesBaseEvent {
  CategoriesFailureLoadEvent();
}

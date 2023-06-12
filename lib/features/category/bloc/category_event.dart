abstract class CategoryBaseEvent {}

class CategoryGetEvent extends CategoryBaseEvent {
  CategoryGetEvent();
}

class CategoryFailureLoadEvent extends CategoryBaseEvent {
  CategoryFailureLoadEvent();
}

class CategoryFilterEvent extends CategoryBaseEvent {
  String tag; ///поля классов final
  CategoryFilterEvent(this.tag);
}

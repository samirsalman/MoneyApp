
class Item {
  String name;
  String icon;

  Item(this.name, this.icon);

  Item.fromJson(Map<String, dynamic> json)
      : name = json['tipo'],
        icon = json['icona'];

  Map<String, dynamic> toJson() => {
    'tipo': name,
    'icona': icon,
  };
}

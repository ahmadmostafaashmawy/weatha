class Weather {
  int id;
  String main;
  String description;

  Weather({this.id, this.main, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    return data;
  }
}

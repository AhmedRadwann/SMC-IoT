class DataModel{
  String? Name;
  dynamic Temp;
  dynamic moisturelevel;
  dynamic Hum;
  bool? control;
  bool? auto;

  DataModel(this.Name, this.Temp, this.Hum,this.control,this.auto,this.moisturelevel);

  DataModel.fromJson(Map<String, dynamic> json) {
    Name = json['Name'];
    Temp = json['Temp'];
    Hum = json['Hum'];
    control=json['control'];
    auto=json['auto'];
    moisturelevel=json['moisturelevel'];

  }
}

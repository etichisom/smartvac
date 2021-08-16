class user {
  Data data;

  user({this.data});

  user.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String email;
  int minUnit;
  var usedUnit;
  var totalUnit;

  Data(
      {this.id,
        this.name,
        this.email,
        this.minUnit,
        this.usedUnit,
        this.totalUnit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    minUnit = json['min_unit'];
    usedUnit = json['used_unit'];
    totalUnit = json['total_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['min_unit'] = this.minUnit;
    data['used_unit'] = this.usedUnit;
    data['total_unit'] = this.totalUnit;
    return data;
  }
}

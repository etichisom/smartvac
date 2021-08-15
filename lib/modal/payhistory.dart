class payh {
  List<Data> data;
  String message;

  payh({this.data, this.message});

  payh.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int userId;
  int amount;
  int units;
  String day;
  int availableUnit;

  Data({this.userId, this.amount, this.units, this.day, this.availableUnit});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    amount = json['amount'];
    units = json['units'];
    day = json['day'];
    availableUnit = json['available_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['units'] = this.units;
    data['day'] = this.day;
    data['available_unit'] = this.availableUnit;
    return data;
  }
}

class usermodel {
  Data data;
  String message;

  usermodel({this.data, this.message});

  usermodel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int iD;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String name;
  String email;
  String password;
  int minUnit;
  var usedUnit;
  var totalUnit;
  Null currentReading;
  Null payment;

  Data(
      {this.iD,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.email,
        this.password,
        this.minUnit,
        this.usedUnit,
        this.totalUnit,
        this.currentReading,
        this.payment});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    minUnit = json['min_unit'];
    usedUnit = json['used_unit'];
    totalUnit = json['total_unit'];
    currentReading = json['CurrentReading'];
    payment = json['Payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['min_unit'] = this.minUnit;
    data['used_unit'] = this.usedUnit;
    data['total_unit'] = this.totalUnit;
    data['CurrentReading'] = this.currentReading;
    data['Payment'] = this.payment;
    return data;
  }
}

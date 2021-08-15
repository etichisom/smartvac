import 'package:web_socket_channel/web_socket_channel.dart';

final channel = WebSocketChannel.connect(
  Uri.parse('ws://smartvac-api.herokuapp.com/ws'),
);
final channel2 = WebSocketChannel.connect(
  Uri.parse('ws://smartvac-api.herokuapp.com/ws'),
);
class socket {
  Units units;
  List<Readings> readings;

  socket({this.units, this.readings});

  socket.fromJson(Map<String, dynamic> json) {
    units = json['units'] != null ? new Units.fromJson(json['units']) : null;
    if (json['readings'] != null) {
      readings = new List<Readings>();
      json['readings'].forEach((v) {
        readings.add(new Readings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.units != null) {
      data['units'] = this.units.toJson();
    }
    if (this.readings != null) {
      data['readings'] = this.readings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Units {
  var usedUnit;
  int totalUnit;

  Units({this.usedUnit, this.totalUnit});

  Units.fromJson(Map<String, dynamic> json) {
    usedUnit = json['used_unit'];
    totalUnit = json['total_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['used_unit'] = this.usedUnit;
    data['total_unit'] = this.totalUnit;
    return data;
  }
}

class Readings {
  var sum;
  String date;

  Readings({this.sum, this.date});

  Readings.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sum'] = this.sum;
    data['date'] = this.date;
    return data;
  }
}


class useage{
String date;
num unit;
useage(this.unit, this.date);
}
List<ChartSampleData> chartData = <ChartSampleData>[
  ChartSampleData(x: '1h', y: 0.541),
  ChartSampleData(x: '2h', y: 0.818),
  ChartSampleData(x: '3h', y: 1.51),
  ChartSampleData(x: '4h', y: 1.302),
  ChartSampleData(x: '5h', y: 2.017),
  ChartSampleData(x: '6h', y: 1.683),
];

class ChartSampleData {
  dynamic x;
  num y;

  ChartSampleData({this.x, this.y});
}
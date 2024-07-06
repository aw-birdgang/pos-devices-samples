import '../common/map_util.dart';

class Pagination {
  int? pageTotal;
  int? total;
  List<dynamic>? listItems = [];

  Pagination({
    this.pageTotal,
    this.total,
    this.listItems,
  });

  Map<String, dynamic> toMap() => {
    "pageTotal": pageTotal,
    "total": total,
    "results": listItems,
  };

  Pagination.fromJson(Map<String, dynamic> map) {
    // print('Pagination.fromJson > map.toString() :: ' + map.toString());
    pageTotal = getItemFromMapForInt(map, "pageTotal");
    total = getItemFromMapForInt(map, "total");
    listItems = getItemFromMapForList(map, "results");
  }

  @override
  String toString() => '${toMap()}';
}

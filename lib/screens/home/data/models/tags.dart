import 'package:get/get.dart';

class Tags {
  int? id;
  String? tag;
  var isSelect = true.obs;


  Tags({this.id, required this.tag});

  Tags.fromJson(Map<String, dynamic> json){
    id = json['id'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag'] = this.tag;
    return data;
  }

  String toString() {
    return 'id: $id tag: $tag isSelect: $isSelect';
  }
}
  List<Tags> tagsList = List.generate(
    demo_data.length,
        (index) => Tags(
          id: demo_data[index]['id'],
          tag: demo_data[index]['tag'],
    ),
  );

  List demo_data = [
  {
    "id": 1,
    "tag": "Recommended",
  },{
    "id": 2,
    "tag": "Superior",
  },{
    "id": 3,
    "tag": "Office",
  },{
    "id": 4,
    "tag": "Family",
  },{
    "id": 4,
    "tag": "Luxury",
  },
  ];

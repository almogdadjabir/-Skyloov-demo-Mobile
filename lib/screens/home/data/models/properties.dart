import 'package:get/get.dart';

class Properties {
  String? id;
  String? title;
  String? imageURL;
  String? location;
  double? price;
  double? distance;
  int? type;
  int? bedroom;
  int? bathroom;
  String? description;
  String? emirate;
  var wishlist = true.obs;



  Properties({this.id, this.title, this.imageURL, this.location, this.price, this.distance, this.type, this.bedroom, this.bathroom, this.description, this.emirate});

  Properties.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    imageURL = json['imageURL'];
    location = json['location'];
    price = double.parse(json['price'].toString());
    distance = double.parse(json['distance'].toString());
    type = json['type'];
    bedroom = json['bedroom'];
    bathroom = json['bathroom'];
    description = json['description'];
    emirate = json['emirate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['title'] = this.title;
    data['imageURL'] = this.imageURL;
    data['location'] = this.location;
    data['price'] = this.price;
    data['distance'] = this.distance;
    data['type'] = this.type;
    data['bedroom'] = this.bedroom;
    data['bathroom'] = this.bathroom;
    data['description'] = this.description;
    data['emirate'] = this.emirate;
    return data;
  }

}
  // List<Properties> propertiesList = List.generate(
  //   demo_data.length,
  //       (index) => Properties(
  //         id: demo_data[index]['id'],
  //         title: demo_data[index]['title'],
  //         imageURL: demo_data[index]['imageURL'],
  //         location: demo_data[index]['location'],
  //         price: demo_data[index]['price'],
  //         distance: demo_data[index]['distance'],
  //         type: demo_data[index]['type'],
  //         bedroom: demo_data[index]['bedroom'],
  //         bathroom: demo_data[index]['bathroom'],
  //         description: demo_data[index]['description'],
  //   ),
  // );
  //
  // List demo_data = [
  // {
  //   "id": 1,
  //   "title": "Best Deal | 2 BHK for sale | Amazing Marina Life",
  //   "imageURL": "https://img.freepik.com/free-photo/modern-tall-glass-buildings-downtown_181624-47596.jpg",
  //   "location": "Emirates Crown, Dubai Marina, Dubai",
  //   "price": 3555.50,
  //   "distance": 1555.50,
  //   "type": 1,
  //   "bedroom": 5,
  //   "bathroom": 3,
  //   "description": "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  // },{
  //     "id": 2,
  //     "title": "New OFFER one Bedroom in Mushrif Totally new",
  //     "imageURL": "https://img.freepik.com/free-photo/abu-dhabi-seascape-with-skyscrapers_181624-11582.jpg",
  //     "location": "Al Mushrif, Al Mushrif, Abu Dhabi",
  //     "price": 1555.50,
  //     "distance": 100.00,
  //     "type": 1,
  //     "bedroom": 5,
  //     "bathroom": 3,
  //     "description": "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  // },{
  //     "id": 3,
  //     "title": "Best Deal | 2 BHK for sale | Amazing Marina Life",
  //     "imageURL": "https://img.freepik.com/free-photo/beautiful-shot-modern-house-kitchen_181624-1846.jpg",
  //     "location": "Emirates Crown, Dubai Marina, Dubai",
  //     "price": 5000.50,
  //     "distance": 4700.00,
  //     "type": 1,
  //     "bedroom": 5,
  //     "bathroom": 3,
  //     "description": "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  // },{
  //     "id": 4,
  //     "title": "New OFFER one Bedroom in Mushrif Totally new",
  //     "imageURL": "https://img.freepik.com/free-photo/abu-dhabi-seascape-with-skyscrapers_181624-11582.jpg",
  //     "location": "Al Mushrif, Al Mushrif, Abu Dhabi",
  //     "price": 3000.00,
  //     "distance": 150.00,
  //     "type": 1,
  //     "bedroom": 5,
  //     "bathroom": 3,
  //     "description": "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  // },{
  //     "id": 5,
  //     "title": "Best Deal | 2 BHK for sale | Amazing Marina Life",
  //     "imageURL": "https://img.freepik.com/free-photo/modern-tall-glass-buildings-downtown_181624-47596.jpg",
  //     "location": "Emirates Crown, Dubai Marina, Dubai",
  //     "price": 750.50,
  //     "distance": 200.00,
  //     "type": 1,
  //     "bedroom": 5,
  //     "bathroom": 3,
  //     "description": "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  // },
  // ];

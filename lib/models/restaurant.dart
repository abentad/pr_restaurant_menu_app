class Restaurant {
  late int restaurantId;
  late String restaurantName;
  late String restaurantImage;

  Restaurant({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'restaurantId': restaurantId.toMap(),
  //     'restaurantName': restaurantName.toMap(),
  //     'restaurantImage': restaurantImage.toMap(),
  //   };
  // }

  // factory Restaurant.fromMap(Map<String, dynamic> map) {
  //   return Restaurant(
  //     restaurantId: late int.fromMap(map['restaurantId']),
  //     restaurantName: late String.fromMap(map['restaurantName']),
  //     restaurantImage: late String.fromMap(map['restaurantImage']),
  //   );
  // }
  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantImage = json['restaurant_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_image'] = this.restaurantImage;
    return data;
  }
}

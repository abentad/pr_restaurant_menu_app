class Food {
  late int foodId;
  late String foodName;
  late String foodDescription;
  late String foodPrice;
  late String foodRating;
  late String foodImage;
  late int restaurantId;

  Food(
      {required this.foodId,
      required this.foodName,
      required this.foodDescription,
      required this.foodPrice,
      required this.foodRating,
      required this.foodImage,
      required this.restaurantId});

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    foodName = json['food_name'];
    foodDescription = json['food_description'];
    foodPrice = json['food_price'];
    foodRating = json['food_rating'];
    foodImage = json['food_image'];
    restaurantId = json['restaurant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_id'] = this.foodId;
    data['food_name'] = this.foodName;
    data['food_description'] = this.foodDescription;
    data['food_price'] = this.foodPrice;
    data['food_rating'] = this.foodRating;
    data['food_image'] = this.foodImage;
    data['restaurant_id'] = this.restaurantId;
    return data;
  }
}

class Productmodel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rate;

  Productmodel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
  });
  factory Productmodel.fromJson(data) {
    return Productmodel(
        id: data["id"],
        title: data['title'],
        price: data['price'],
        description: data['description'],
        category: data['category'],
        image: data['image'],
        rate: RatingModel.fromJson(data["rating"]));
  }
}

class RatingModel {
  final num rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(data) {
    return RatingModel(rate: data["rate"], count: data["count"]);
  }
}

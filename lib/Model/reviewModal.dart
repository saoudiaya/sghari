// ignore: file_names
class ReviewModal {
  String image = '';
  String name = '';
  double rating = 0.0;
  String date = '';
  String comment = '';

  ReviewModal(
      {required this.image,
      required this.name,
      required this.rating,
      required this.date,
      required this.comment});

  ReviewModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    rating = json['rating'];
    date = json['date'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['rating'] = rating;
    data['date'] = date;
    data['comment'] = comment;
    return data;
  }
}

class PropertyModel {
  final String id;
  final String title;
  final String location;
  final List<String> imageUrls;
  final double price;
  final int sqft;
  final int bedrooms;
  final int bathrooms;
  final List<String> tags;
  final List<String> badges;
  final bool isVerified;

  PropertyModel({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrls,
    required this.price,
    required this.sqft,
    required this.bedrooms,
    required this.bathrooms,
    required this.tags,
    required this.badges,
    this.isVerified = false,
  });
}

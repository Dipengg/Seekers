class CatalogItem {
  final String id;
  final String title;
  final String category;
  final String location;
  final String registrationNumber;
  final String date;
  final String imageUrl; 
  final bool isClaimed;

  const CatalogItem({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.registrationNumber,
    required this.date,
    required this.imageUrl,
    required this.isClaimed,
  });

  CatalogItem copyWith({
    String? id,
    String? title,
    String? category,
    String? location,
    String? registrationNumber,
    String? date,
    String? imageUrl,
    bool? isClaimed,
  }) {
    return CatalogItem(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      location: location ?? this.location,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
      isClaimed: isClaimed ?? this.isClaimed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'location': location,
      'registrationNumber': registrationNumber,
      'date': date,
      'imageUrl': imageUrl,
      'isClaimed': isClaimed,
    };
  }

  factory CatalogItem.fromJson(Map<String, dynamic> json) {
    return CatalogItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      location: json['location'] ?? '',
      registrationNumber: json['registrationNumber'] ?? '',
      date: json['date'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      isClaimed: json['isClaimed'] ?? false,
    );
  }
}

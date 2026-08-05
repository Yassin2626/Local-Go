library;

class Guide {
  const Guide({
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.guideCount,
    required this.area,
    required this.description,
    required this.hourlyRate,
    this.isVerified = false,
    this.rating = 0.0,
    this.tourCount = 0,
    this.bio = '',
    this.location = '',
    this.quote = '',
  });

  final String name;
  final int age;
  final String imageUrl;
  final int guideCount;
  final String area;
  final String description;
  final int hourlyRate;
  final bool isVerified;
  final double rating;
  final int tourCount;
  final String bio;
  final String location;
  final String quote;

  String get subtitle => 'Guided $guideCount Times in $area';
  String get statsSubtitle => 'Guided $guideCount Times \u2022 100% Trusted Score';

  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }
}

class SecretSpot {
  const SecretSpot({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.distance,
    required this.type,
  });

  final String name;
  final String description;
  final String imageUrl;
  final String distance;
  final String type;
}

class GuideReview {
  const GuideReview({
    required this.reviewerName,
    required this.date,
    required this.rating,
    required this.comment,
    this.initials = '',
  });

  final String reviewerName;
  final String date;
  final int rating;
  final String comment;
  final String initials;
}

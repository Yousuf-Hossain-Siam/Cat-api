class Cat {
  final String length;
  final String origin;
  final String imageLink;
  final int familyFriendly;
  final int shedding;
  final int generalHealth;
  final int playfulness;
  final int childrenFriendly;
  final int grooming;
  final int intelligence;
  final int otherPetsFriendly;
  final double minWeight;
  final double maxWeight;
  final double minLifeExpectancy;
  final double maxLifeExpectancy;
  final String name;

  Cat({
    required this.length,
    required this.origin,
    required this.imageLink,
    required this.familyFriendly,
    required this.shedding,
    required this.generalHealth,
    required this.playfulness,
    required this.childrenFriendly,
    required this.grooming,
    required this.intelligence,
    required this.otherPetsFriendly,
    required this.minWeight,
    required this.maxWeight,
    required this.minLifeExpectancy,
    required this.maxLifeExpectancy,
    required this.name,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      length: json['length'] ?? '',
      origin: json['origin'] ?? '',
      imageLink: json['image_link'] ?? '',
      familyFriendly: json['family_friendly'] ?? 0,
      shedding: json['shedding'] ?? 0,
      generalHealth: json['general_health'] ?? 0,
      playfulness: json['playfulness'] ?? 0,
      childrenFriendly: json['children_friendly'] ?? 0,
      grooming: json['grooming'] ?? 0,
      intelligence: json['intelligence'] ?? 0,
      otherPetsFriendly: json['other_pets_friendly'] ?? 0,
      minWeight: (json['min_weight'] ?? 0).toDouble(),
      maxWeight: (json['max_weight'] ?? 0).toDouble(),
      minLifeExpectancy: (json['min_life_expectancy'] ?? 0).toDouble(),
      maxLifeExpectancy: (json['max_life_expectancy'] ?? 0).toDouble(),
      name: json['name'] ?? '',
    );
  }
}
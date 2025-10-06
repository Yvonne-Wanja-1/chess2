class Achievement {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final int points;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  final String rarity; // common, rare, epic, legendary

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.points,
    this.isUnlocked = false,
    this.unlockedAt,
    required this.rarity,
  });
}

class Badge {
  final String id;
  final String name;
  final String description;
  final String iconPath;
  final String category; // e.g., 'skill', 'social', 'tournament'
  final String rarity;
  final bool isEquipped;

  Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.category,
    required this.rarity,
    this.isEquipped = false,
  });
}

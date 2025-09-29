class Team {
  final String id;
  final String name;
  final String? logoUrl;
  final String motto;
  final String captainId;
  final List<String> memberIds;
  final Map<String, int> ratings;
  final List<String> trophies;
  final String? schoolId;
  final Map<String, int> stats;

  Team({
    required this.id,
    required this.name,
    this.logoUrl,
    required this.motto,
    required this.captainId,
    List<String>? memberIds,
    Map<String, int>? ratings,
    List<String>? trophies,
    this.schoolId,
    Map<String, int>? stats,
  }) : memberIds = memberIds ?? [],
       ratings = ratings ?? {'team_blitz': 1200, 'team_rapid': 1200},
       trophies = trophies ?? [],
       stats =
           stats ??
           {
             'matches_won': 0,
             'matches_lost': 0,
             'matches_drawn': 0,
             'tournaments_won': 0,
           };

  Team copyWith({
    String? name,
    String? logoUrl,
    String? motto,
    String? captainId,
    List<String>? memberIds,
    Map<String, int>? ratings,
    List<String>? trophies,
    String? schoolId,
    Map<String, int>? stats,
  }) {
    return Team(
      id: id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      motto: motto ?? this.motto,
      captainId: captainId ?? this.captainId,
      memberIds: memberIds ?? List.from(this.memberIds),
      ratings: ratings ?? Map.from(this.ratings),
      trophies: trophies ?? List.from(this.trophies),
      schoolId: schoolId ?? this.schoolId,
      stats: stats ?? Map.from(this.stats),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'motto': motto,
      'captainId': captainId,
      'memberIds': memberIds,
      'ratings': ratings,
      'trophies': trophies,
      'schoolId': schoolId,
      'stats': stats,
    };
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      motto: json['motto'],
      captainId: json['captainId'],
      memberIds: List<String>.from(json['memberIds']),
      ratings: Map<String, int>.from(json['ratings']),
      trophies: List<String>.from(json['trophies']),
      schoolId: json['schoolId'],
      stats: Map<String, int>.from(json['stats']),
    );
  }
}

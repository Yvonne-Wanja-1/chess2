class Player {
  final String id;
  final String username;
  final String email;
  final String? schoolId;
  final String? teamId;
  final String? avatarUrl;
  final Map<String, int> ratings;
  final List<String> achievements;
  final Map<String, int> stats;

  Player({
    required this.id,
    required this.username,
    required this.email,
    this.schoolId,
    this.teamId,
    this.avatarUrl,
    Map<String, int>? ratings,
    List<String>? achievements,
    Map<String, int>? stats,
  }) : ratings =
           ratings ??
           {'blitz': 1200, 'rapid': 1200, 'bullet': 1200, 'puzzle': 1200},
       achievements = achievements ?? [],
       stats =
           stats ??
           {
             'wins': 0,
             'losses': 0,
             'draws': 0,
             'puzzles_solved': 0,
             'current_streak': 0,
             'best_streak': 0,
           };

  Player copyWith({
    String? username,
    String? email,
    String? schoolId,
    String? teamId,
    String? avatarUrl,
    Map<String, int>? ratings,
    List<String>? achievements,
    Map<String, int>? stats,
  }) {
    return Player(
      id: id,
      username: username ?? this.username,
      email: email ?? this.email,
      schoolId: schoolId ?? this.schoolId,
      teamId: teamId ?? this.teamId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      ratings: ratings ?? Map.from(this.ratings),
      achievements: achievements ?? List.from(this.achievements),
      stats: stats ?? Map.from(this.stats),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'schoolId': schoolId,
      'teamId': teamId,
      'avatarUrl': avatarUrl,
      'ratings': ratings,
      'achievements': achievements,
      'stats': stats,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      schoolId: json['schoolId'],
      teamId: json['teamId'],
      avatarUrl: json['avatarUrl'],
      ratings: Map<String, int>.from(json['ratings']),
      achievements: List<String>.from(json['achievements']),
      stats: Map<String, int>.from(json['stats']),
    );
  }
}

class ActiveChallenges {
  final int id;
  final String challengeName;
  final int challengePoints;
  final DateTime challengeTime;
  final String challengeType;
  final int state;
  final String challengeDescription;
  final int sharedChallengeStatus;
  final int approvedSharedChallenge;
  final String challengeContent;

  ActiveChallenges({
    required this.id,
    required this.challengeName,
    required this.challengePoints,
    required this.challengeTime,
    required this.challengeType,
    required this.state,
    required this.challengeDescription,
    required this.sharedChallengeStatus,
    required this.approvedSharedChallenge,
    required this.challengeContent,
  });

  // Método para convertir JSON en ActiveChallenges
  factory ActiveChallenges.fromJson(Map<String, dynamic> json) {
    return ActiveChallenges(
      id: json['id'],
      challengeName: json['challenge_name'],
      challengePoints: json['challenge_points'],
      challengeTime: DateTime.parse(json['challenge_time']),
      challengeType: json['challenge_type'],
      state: json['state'],
      challengeDescription: json['challenge_description'],
      sharedChallengeStatus: json['shared_challenge_status'],
      approvedSharedChallenge: json['approved_shared_challenge'],
      challengeContent: json['challenge_content'],
    );
  }
}

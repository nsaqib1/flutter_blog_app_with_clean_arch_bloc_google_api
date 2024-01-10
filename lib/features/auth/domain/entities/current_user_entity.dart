class CurrentUserEntity {
  final String? name;
  final String? avatarUrl;
  final Map<String, dynamic> token;

  CurrentUserEntity({
    required this.name,
    required this.avatarUrl,
    required this.token,
  });
}

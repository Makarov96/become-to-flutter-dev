class Country {
  const Country({
    required this.commonName,
    required this.officialName,
    required this.capitals,
    required this.continents,
    required this.flagImageUrl,
  });
  final String commonName;
  final String officialName;
  final List<String> capitals;
  final List<String> continents;
  final String flagImageUrl;
}

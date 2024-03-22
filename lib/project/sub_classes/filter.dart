class Filter {
  final String name;
  final FilterTypes type;

  const Filter({required this.name, required this.type});
}

enum FilterTypes {
  lrgb,
  rgb,
  halpha,
  oiii,
  sii,
  uhc,
  uvir,
  ir,
  other,
}

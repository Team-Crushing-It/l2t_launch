class HelpItem {
  const HelpItem({
    required this.title,
    required this.subtitle,
    this.url,
  });

  final String? title;
  final String? subtitle;
  final String? url;
}

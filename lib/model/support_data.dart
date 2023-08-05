class SupportData {
  final String url;
  final String text;

  SupportData({
    required this.url,
    required this.text,
  });

  factory SupportData.fromJson(Map<String, dynamic> json) {
    return SupportData(
      url: json['url'],
      text: json['text'],
    );
  }
}





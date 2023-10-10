class Currency {
  final Map<String, double> data;

  Currency({required this.data});

  factory Currency.fromJson(Map<String, dynamic> json) {
    final dataMap = json['data'] as Map<String, dynamic>;
    final convertedData = dataMap.map<String, double>(
      (key, value) => MapEntry(key, (value as num).toDouble()),
    );

    return Currency(data: convertedData);
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{'data': data};
    return json;
  }
}

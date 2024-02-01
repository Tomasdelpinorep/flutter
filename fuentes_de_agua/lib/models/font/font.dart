import 'result.dart';

class Font {
  int? totalCount;
  List<Result>? results;

  Font({this.totalCount, this.results});

  factory Font.fromJson(Map<String, dynamic> json) => Font(
        totalCount: json['total_count'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}

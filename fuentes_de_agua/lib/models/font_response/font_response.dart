import 'result.dart';

class FontResponse {
  int? totalCount;
  List<Result>? results;

  FontResponse({this.totalCount, this.results});

  factory FontResponse.fromJson(Map<String, dynamic> json) => FontResponse(
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

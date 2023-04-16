class MetaResponse {
  MetaResponse({
    required this.code,
    required this.status,
    required this.message,
  });

  final int code;
  final String status;
  final String message;

  factory MetaResponse.fromJson(Map<String, dynamic> json) => MetaResponse(
        code: json['code'],
        status: json['status'],
        message: json['message'],
      );
}
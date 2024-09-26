import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRemoteClient {
  Future<ResponseGenerics<Map<String, dynamic>, RemoteClientEnumError>> get(
      String url,
      Map<String, dynamic>? body,
      );
  Future<ResponseGenerics<Map<String, dynamic>, RemoteClientEnumError>> post({
    required String url,
    required Map<String, dynamic> body
});
}

class RemoteClient implements AbstractRemoteClient {
  final _dio = Dio();

  @override
  Future<ResponseGenerics<Map<String, dynamic>, RemoteClientEnumError>> get(
      String url, Map<String, dynamic>? body,) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(url,
          );
      if (response.statusCode != 200) {
        return ResponseGenerics(
            statusCode: response.statusCode!,
            error: RemoteClientEnumError.badRequest);
      }
      return ResponseGenerics(statusCode: 200, data: response.data);
    } catch (_) {
      return ResponseGenerics(
          statusCode: 400, error: RemoteClientEnumError.badRequest);
    }
  }
  
  @override
  Future<ResponseGenerics<Map<String, dynamic>, RemoteClientEnumError>> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.post(url, data: body);
      if (response.statusCode != 200) {
        return ResponseGenerics(
            statusCode: response.statusCode!,
            error: RemoteClientEnumError.badRequest);
      }
      return ResponseGenerics(statusCode: 200, data: response.data);
    } catch (e) {
     return ResponseGenerics(
          statusCode: 400, error: RemoteClientEnumError.badRequest);
    }
  }

}

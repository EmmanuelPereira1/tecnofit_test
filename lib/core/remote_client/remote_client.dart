import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRemoteClient {
  Future<ResponseGenerics<Map<String, dynamic>, RemoteClientEnumError>> get(
      String url);
}

class RemoteClient implements AbstractRemoteClient {
  final _dio = Dio();

  @override
  Future<ResponseGenerics<Map<String, dynamic>, RemoteClientEnumError>> get(
      String url) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(url,
          options: Options(headers: {
            'x-prolog-api-token':
                'ePTC2XrkY34WKUCXq48fTxrLCzdV3M35MNpCfBYavabwwY9BJXg',
          }));
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
}

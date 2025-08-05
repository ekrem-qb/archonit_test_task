import 'package:dio/dio.dart';

import '/api/entity/asset.dart';
import '/consts.dart';

class ApiClient {
  ApiClient(this.dio);

  final Dio dio;

  Future<List<Asset>> getAssets({
    required final int limit,
    final int? offset,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '${kBaseUrl}assets?apiKey=$kApiKey&limit=$limit${offset != null ? '&offset=$offset' : ''}',
    );
    final assetsJson = response.data?['data'] as List<dynamic>;
    final assets = assetsJson
        .map((final json) => Asset.fromJson(json as Map<String, dynamic>))
        .toList();
    return assets;
  }
}

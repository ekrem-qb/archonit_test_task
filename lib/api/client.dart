import 'package:archonit_test_task/api/entity/asset.dart';
import 'package:archonit_test_task/consts.dart';
import 'package:dio/dio.dart';

class ApiClient {
  ApiClient(this.dio);

  final Dio dio;

  Future<List<Asset>> getAssets() async {
    final response = await dio.get(
      'https://rest.coincap.io/v3/assets?apiKey=$kApikey',
    );
    final assetsJson = response.data['data'] as List<dynamic>;
    final assets = assetsJson
        .map((final json) => Asset.fromJson(json as Map<String, dynamic>))
        .toList();
    return assets;
  }
}

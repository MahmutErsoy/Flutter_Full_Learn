import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
}

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('https://reqres.in/api/unknown');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}

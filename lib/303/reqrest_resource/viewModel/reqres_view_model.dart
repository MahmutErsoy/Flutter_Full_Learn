import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:flutter_full_learn/product/service/project_network_manager.dart';

import '../view/reqres_view.dart';

abstract class ReqResViewModel extends LoadingStatefull<ReqResView> with ProjectDioMixin {
  late final IReqresService
      reqresService; // late final dersek sadece init state içinde eşitleyebilecegin anlamına gelir.

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('veli');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}

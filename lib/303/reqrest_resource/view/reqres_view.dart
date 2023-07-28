import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqResViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) {
                        return const ImageLearn202();
                      },
                    ));
                  },
                  child: const Icon(
                    Icons.ac_unit,
                  ))
            ],
            title:
                context.watch<ReqResProvider>().isLoading ? const CircularProgressIndicator(color: Colors.white) : null,
          ),
          body: Column(
            children: [
              Selector<ReqResProvider, bool>(
                builder: (context, value, child) {
                  return value ? const Placeholder() : const Text('data');
                },
                selector: (context, provider) {
                  return provider.isLoading;
                },
              ),
              Expanded(child: _resourceListview(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        inspect(items[index]);
        return Card(color: Color(items[index].color?.colorValue ?? 0), child: Text(items[index].name ?? ''));
      },
    );
  }
}

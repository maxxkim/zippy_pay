import 'package:zippy/data/repository/top_up/top_up_data_repository.dart';
import 'package:zippy/domain/repository/top_up/top_up_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static TopUpRepository? _topUpRepository;

  static TopUpRepository topUpRepository() {
    _topUpRepository ??= TopUpDataRepository(
      ApiModule.apiUtil(),
    );
    return _topUpRepository!;
  }
}
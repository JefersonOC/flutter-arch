import 'package:sample/remote/PicDataSource.dart';
import 'package:sample/repository/PicsRepository.dart';

enum Flavor { MOCK, PROD, STAGE }

class Injector {
  static final Injector _singleton = new Injector._internal();

  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  static Flavor getFlavor() {
    return _flavor;
  }

  factory Injector() {
    return _singleton;
  }

  static Future<PicsRepository> providePicsRepository() async {
    return new PicsRepositoryImpl(new RemoteDataSource());
  }

  Injector._internal();
}

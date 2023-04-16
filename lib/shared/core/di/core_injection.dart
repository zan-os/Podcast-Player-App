import 'package:just_audio/just_audio.dart';
import '../../../registered_injection.dart';
import '../../common/constants/constant_values.dart';
import '../network/dio_client.dart';

class CoreInjection {
  CoreInjection() {
    _registerCore();
  }
  void _registerCore() {
    sl.registerLazySingleton(() => AudioPlayer());
    sl.registerLazySingleton(() => sl<DioClient>().dio);
    sl.registerLazySingleton(() => DioClient(
        baseUrl: ConstantValues.apiConstant.baseUrl,
        apiKey: "7099ba481c3b4c5caed3228badcb359c"));
  }
}

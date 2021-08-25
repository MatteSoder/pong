// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:grpc/grpc_connection_interface.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../src/data/client/pong_client.dart' as _i4;
import '../src/data/client/pong_local_client.dart' as _i6;
import '../src/data/client/pong_web_client.dart' as _i5;
import 'injectable.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.ClientChannelBase>(() => registerModule.channel);
  gh.lazySingleton<_i4.PongClient>(
      () => _i5.PongWebClientImpl(channel: get<_i3.ClientChannelBase>()),
      instanceName: 'pong_web',
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i4.PongClient>(() => _i6.PongLocalClientImpl(),
      instanceName: 'pong_local', dispose: (i) => i.dispose());
  gh.factory<_i5.PongClientOptions>(() => registerModule.clientOpt,
      instanceName: 'client-config');
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}

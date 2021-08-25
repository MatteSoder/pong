import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
//import 'package:grpc/grpc_web.dart';
import 'package:injectable/injectable.dart';
import 'package:pong/src/data/client/pong_web_client.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'injectable.config.dart';

@module
abstract class RegisterModule {
  @Named('client-config')
  PongClientOptions get clientOpt => PongClientOptions(
        baseUrl: Platform.isIOS ? 'localhost' : '10.0.2.2',
        port: 8090,
      );
/*
  ClientChannelBase get channel => kIsWeb
      ? GrpcWebClientChannel.xhr(Uri.parse('http://127.0.0.1:8090'))
      : ClientChannel(
          Platform.isIOS ? 'localhost' : '10.0.2.2',
          port: 8090,
          options: ChannelOptions(
            credentials: ChannelCredentials.insecure(),
            connectionTimeout: Duration(seconds: 30),
          ),
        );*/

  ClientChannelBase get channel => ClientChannel(
        Platform.isIOS ? 'localhost' : '10.0.2.2',
        port: 8090,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectionTimeout: Duration(seconds: 30),
        ),
      );
}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);

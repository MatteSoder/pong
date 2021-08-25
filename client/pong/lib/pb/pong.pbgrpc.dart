///
//  Generated code. Do not modify.
//  source: pong.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'pong.pb.dart' as $0;
export 'pong.pb.dart';

class GameServiceClient extends $grpc.Client {
  static final _$connect =
      $grpc.ClientMethod<$0.ConnectRequest, $0.ConnectResponse>(
          '/pong.v1.GameService/Connect',
          ($0.ConnectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ConnectResponse.fromBuffer(value));
  static final _$stream =
      $grpc.ClientMethod<$0.StreamRequest, $0.StreamResponse>(
          '/pong.v1.GameService/Stream',
          ($0.StreamRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StreamResponse.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ConnectResponse> connect($0.ConnectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connect, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamResponse> stream(
      $async.Stream<$0.StreamRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$stream, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'pong.v1.GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ConnectRequest, $0.ConnectResponse>(
        'Connect',
        connect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ConnectRequest.fromBuffer(value),
        ($0.ConnectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamRequest, $0.StreamResponse>(
        'Stream',
        stream,
        true,
        true,
        ($core.List<$core.int> value) => $0.StreamRequest.fromBuffer(value),
        ($0.StreamResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ConnectResponse> connect_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ConnectRequest> request) async {
    return connect(call, await request);
  }

  $async.Future<$0.ConnectResponse> connect(
      $grpc.ServiceCall call, $0.ConnectRequest request);
  $async.Stream<$0.StreamResponse> stream(
      $grpc.ServiceCall call, $async.Stream<$0.StreamRequest> request);
}

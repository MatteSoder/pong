///
//  Generated code. Do not modify.
//  source: pong.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use directionDescriptor instead')
const Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'DIRECTION_NONE', '2': 0},
    const {'1': 'DIRECTION_UP', '2': 1},
    const {'1': 'DIRECTION_DOWN', '2': 2},
    const {'1': 'DIRECTION_LEFT', '2': 3},
    const {'1': 'DIRECTION_RIGHT', '2': 4},
  ],
};

/// Descriptor for `Direction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List directionDescriptor = $convert.base64Decode('CglEaXJlY3Rpb24SEgoORElSRUNUSU9OX05PTkUQABIQCgxESVJFQ1RJT05fVVAQARISCg5ESVJFQ1RJT05fRE9XThACEhIKDkRJUkVDVElPTl9MRUZUEAMSEwoPRElSRUNUSU9OX1JJR0hUEAQ=');
@$core.Deprecated('Use connectRequestDescriptor instead')
const ConnectRequest$json = const {
  '1': 'ConnectRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectRequestDescriptor = $convert.base64Decode('Cg5Db25uZWN0UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use connectResponseDescriptor instead')
const ConnectResponse$json = const {
  '1': 'ConnectResponse',
  '2': const [
    const {'1': 'client_id', '3': 1, '4': 1, '5': 9, '10': 'clientId'},
    const {'1': 'entities', '3': 2, '4': 3, '5': 11, '6': '.pong.v1.Entity', '10': 'entities'},
  ],
};

/// Descriptor for `ConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectResponseDescriptor = $convert.base64Decode('Cg9Db25uZWN0UmVzcG9uc2USGwoJY2xpZW50X2lkGAEgASgJUghjbGllbnRJZBIrCghlbnRpdGllcxgCIAMoCzIPLnBvbmcudjEuRW50aXR5UghlbnRpdGllcw==');
@$core.Deprecated('Use coordinateDescriptor instead')
const Coordinate$json = const {
  '1': 'Coordinate',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
  ],
};

/// Descriptor for `Coordinate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coordinateDescriptor = $convert.base64Decode('CgpDb29yZGluYXRlEgwKAXgYASABKAFSAXgSDAoBeRgCIAEoAVIBeQ==');
@$core.Deprecated('Use gameRequestDescriptor instead')
const GameRequest$json = const {
  '1': 'GameRequest',
  '2': const [
    const {'1': 'direction', '3': 1, '4': 1, '5': 14, '6': '.pong.v1.Direction', '10': 'direction'},
  ],
};

/// Descriptor for `GameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameRequestDescriptor = $convert.base64Decode('CgtHYW1lUmVxdWVzdBIwCglkaXJlY3Rpb24YASABKA4yEi5wb25nLnYxLkRpcmVjdGlvblIJZGlyZWN0aW9u');
@$core.Deprecated('Use playerDescriptor instead')
const Player$json = const {
  '1': 'Player',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.pong.v1.Coordinate', '10': 'position'},
  ],
};

/// Descriptor for `Player`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDescriptor = $convert.base64Decode('CgZQbGF5ZXISDgoCaWQYASABKAlSAmlkEi8KCHBvc2l0aW9uGAIgASgLMhMucG9uZy52MS5Db29yZGluYXRlUghwb3NpdGlvbg==');
@$core.Deprecated('Use ballDescriptor instead')
const Ball$json = const {
  '1': 'Ball',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.pong.v1.Coordinate', '10': 'position'},
  ],
};

/// Descriptor for `Ball`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ballDescriptor = $convert.base64Decode('CgRCYWxsEg4KAmlkGAEgASgJUgJpZBIvCghwb3NpdGlvbhgCIAEoCzITLnBvbmcudjEuQ29vcmRpbmF0ZVIIcG9zaXRpb24=');
@$core.Deprecated('Use entityDescriptor instead')
const Entity$json = const {
  '1': 'Entity',
  '2': const [
    const {'1': 'player', '3': 2, '4': 1, '5': 11, '6': '.pong.v1.Player', '9': 0, '10': 'player'},
    const {'1': 'ball', '3': 3, '4': 1, '5': 11, '6': '.pong.v1.Ball', '9': 0, '10': 'ball'},
  ],
  '8': const [
    const {'1': 'entity'},
  ],
};

/// Descriptor for `Entity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityDescriptor = $convert.base64Decode('CgZFbnRpdHkSKQoGcGxheWVyGAIgASgLMg8ucG9uZy52MS5QbGF5ZXJIAFIGcGxheWVyEiMKBGJhbGwYAyABKAsyDS5wb25nLnYxLkJhbGxIAFIEYmFsbEIICgZlbnRpdHk=');
@$core.Deprecated('Use moveDescriptor instead')
const Move$json = const {
  '1': 'Move',
  '2': const [
    const {'1': 'direction', '3': 1, '4': 1, '5': 14, '6': '.pong.v1.Direction', '10': 'direction'},
  ],
};

/// Descriptor for `Move`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveDescriptor = $convert.base64Decode('CgRNb3ZlEjAKCWRpcmVjdGlvbhgBIAEoDjISLnBvbmcudjEuRGlyZWN0aW9uUglkaXJlY3Rpb24=');
@$core.Deprecated('Use addEntityDescriptor instead')
const AddEntity$json = const {
  '1': 'AddEntity',
  '2': const [
    const {'1': 'entity', '3': 1, '4': 1, '5': 11, '6': '.pong.v1.Entity', '10': 'entity'},
  ],
};

/// Descriptor for `AddEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEntityDescriptor = $convert.base64Decode('CglBZGRFbnRpdHkSJwoGZW50aXR5GAEgASgLMg8ucG9uZy52MS5FbnRpdHlSBmVudGl0eQ==');
@$core.Deprecated('Use updateEntityDescriptor instead')
const UpdateEntity$json = const {
  '1': 'UpdateEntity',
  '2': const [
    const {'1': 'entity', '3': 1, '4': 1, '5': 11, '6': '.pong.v1.Entity', '10': 'entity'},
  ],
};

/// Descriptor for `UpdateEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEntityDescriptor = $convert.base64Decode('CgxVcGRhdGVFbnRpdHkSJwoGZW50aXR5GAEgASgLMg8ucG9uZy52MS5FbnRpdHlSBmVudGl0eQ==');
@$core.Deprecated('Use streamRequestDescriptor instead')
const StreamRequest$json = const {
  '1': 'StreamRequest',
  '2': const [
    const {'1': 'move', '3': 1, '4': 1, '5': 11, '6': '.pong.v1.Move', '9': 0, '10': 'move'},
  ],
  '8': const [
    const {'1': 'action'},
  ],
};

/// Descriptor for `StreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamRequestDescriptor = $convert.base64Decode('Cg1TdHJlYW1SZXF1ZXN0EiMKBG1vdmUYASABKAsyDS5wb25nLnYxLk1vdmVIAFIEbW92ZUIICgZhY3Rpb24=');
@$core.Deprecated('Use streamResponseDescriptor instead')
const StreamResponse$json = const {
  '1': 'StreamResponse',
  '2': const [
    const {'1': 'add_entity', '3': 1, '4': 1, '5': 11, '6': '.pong.v1.AddEntity', '9': 0, '10': 'addEntity'},
    const {'1': 'update_entity', '3': 2, '4': 1, '5': 11, '6': '.pong.v1.UpdateEntity', '9': 0, '10': 'updateEntity'},
  ],
  '8': const [
    const {'1': 'action'},
  ],
};

/// Descriptor for `StreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamResponseDescriptor = $convert.base64Decode('Cg5TdHJlYW1SZXNwb25zZRIzCgphZGRfZW50aXR5GAEgASgLMhIucG9uZy52MS5BZGRFbnRpdHlIAFIJYWRkRW50aXR5EjwKDXVwZGF0ZV9lbnRpdHkYAiABKAsyFS5wb25nLnYxLlVwZGF0ZUVudGl0eUgAUgx1cGRhdGVFbnRpdHlCCAoGYWN0aW9u');

///
//  Generated code. Do not modify.
//  source: pong.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Direction extends $pb.ProtobufEnum {
  static const Direction DIRECTION_NONE = Direction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DIRECTION_NONE');
  static const Direction DIRECTION_UP = Direction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DIRECTION_UP');
  static const Direction DIRECTION_DOWN = Direction._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DIRECTION_DOWN');
  static const Direction DIRECTION_LEFT = Direction._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DIRECTION_LEFT');
  static const Direction DIRECTION_RIGHT = Direction._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DIRECTION_RIGHT');

  static const $core.List<Direction> values = <Direction> [
    DIRECTION_NONE,
    DIRECTION_UP,
    DIRECTION_DOWN,
    DIRECTION_LEFT,
    DIRECTION_RIGHT,
  ];

  static final $core.Map<$core.int, Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Direction? valueOf($core.int value) => _byValue[value];

  const Direction._($core.int v, $core.String n) : super(v, n);
}


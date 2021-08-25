///
//  Generated code. Do not modify.
//  source: pong.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'pong.pbenum.dart';

export 'pong.pbenum.dart';

class ConnectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  ConnectRequest._() : super();
  factory ConnectRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest)) as ConnectRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ConnectResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientId')
    ..pc<Entity>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entities', $pb.PbFieldType.PM, subBuilder: Entity.create)
    ..hasRequiredFields = false
  ;

  ConnectResponse._() : super();
  factory ConnectResponse({
    $core.String? clientId,
    $core.Iterable<Entity>? entities,
  }) {
    final _result = create();
    if (clientId != null) {
      _result.clientId = clientId;
    }
    if (entities != null) {
      _result.entities.addAll(entities);
    }
    return _result;
  }
  factory ConnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectResponse clone() => ConnectResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectResponse copyWith(void Function(ConnectResponse) updates) => super.copyWith((message) => updates(message as ConnectResponse)) as ConnectResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectResponse create() => ConnectResponse._();
  ConnectResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectResponse> createRepeated() => $pb.PbList<ConnectResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectResponse>(create);
  static ConnectResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Entity> get entities => $_getList(1);
}

class Coordinate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Coordinate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Coordinate._() : super();
  factory Coordinate({
    $core.double? x,
    $core.double? y,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory Coordinate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coordinate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Coordinate clone() => Coordinate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Coordinate copyWith(void Function(Coordinate) updates) => super.copyWith((message) => updates(message as Coordinate)) as Coordinate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Coordinate create() => Coordinate._();
  Coordinate createEmptyInstance() => create();
  static $pb.PbList<Coordinate> createRepeated() => $pb.PbList<Coordinate>();
  @$core.pragma('dart2js:noInline')
  static Coordinate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coordinate>(create);
  static Coordinate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class GameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..e<Direction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: Direction.DIRECTION_NONE, valueOf: Direction.valueOf, enumValues: Direction.values)
    ..hasRequiredFields = false
  ;

  GameRequest._() : super();
  factory GameRequest({
    Direction? direction,
  }) {
    final _result = create();
    if (direction != null) {
      _result.direction = direction;
    }
    return _result;
  }
  factory GameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameRequest clone() => GameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameRequest copyWith(void Function(GameRequest) updates) => super.copyWith((message) => updates(message as GameRequest)) as GameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameRequest create() => GameRequest._();
  GameRequest createEmptyInstance() => create();
  static $pb.PbList<GameRequest> createRepeated() => $pb.PbList<GameRequest>();
  @$core.pragma('dart2js:noInline')
  static GameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameRequest>(create);
  static GameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Direction get direction => $_getN(0);
  @$pb.TagNumber(1)
  set direction(Direction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearDirection() => clearField(1);
}

class Player extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Player', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Coordinate>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position', subBuilder: Coordinate.create)
    ..hasRequiredFields = false
  ;

  Player._() : super();
  factory Player({
    $core.String? id,
    Coordinate? position,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory Player.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Player.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Player clone() => Player()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Player copyWith(void Function(Player) updates) => super.copyWith((message) => updates(message as Player)) as Player; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Player create() => Player._();
  Player createEmptyInstance() => create();
  static $pb.PbList<Player> createRepeated() => $pb.PbList<Player>();
  @$core.pragma('dart2js:noInline')
  static Player getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Player>(create);
  static Player? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Coordinate get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(Coordinate v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  Coordinate ensurePosition() => $_ensure(1);
}

class Ball extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Ball', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Coordinate>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position', subBuilder: Coordinate.create)
    ..hasRequiredFields = false
  ;

  Ball._() : super();
  factory Ball({
    $core.String? id,
    Coordinate? position,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory Ball.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ball.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ball clone() => Ball()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ball copyWith(void Function(Ball) updates) => super.copyWith((message) => updates(message as Ball)) as Ball; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ball create() => Ball._();
  Ball createEmptyInstance() => create();
  static $pb.PbList<Ball> createRepeated() => $pb.PbList<Ball>();
  @$core.pragma('dart2js:noInline')
  static Ball getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ball>(create);
  static Ball? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Coordinate get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(Coordinate v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  Coordinate ensurePosition() => $_ensure(1);
}

enum Entity_Entity {
  player, 
  ball, 
  notSet
}

class Entity extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Entity_Entity> _Entity_EntityByTag = {
    2 : Entity_Entity.player,
    3 : Entity_Entity.ball,
    0 : Entity_Entity.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Entity', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOM<Player>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'player', subBuilder: Player.create)
    ..aOM<Ball>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ball', subBuilder: Ball.create)
    ..hasRequiredFields = false
  ;

  Entity._() : super();
  factory Entity({
    Player? player,
    Ball? ball,
  }) {
    final _result = create();
    if (player != null) {
      _result.player = player;
    }
    if (ball != null) {
      _result.ball = ball;
    }
    return _result;
  }
  factory Entity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Entity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Entity clone() => Entity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Entity copyWith(void Function(Entity) updates) => super.copyWith((message) => updates(message as Entity)) as Entity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Entity create() => Entity._();
  Entity createEmptyInstance() => create();
  static $pb.PbList<Entity> createRepeated() => $pb.PbList<Entity>();
  @$core.pragma('dart2js:noInline')
  static Entity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Entity>(create);
  static Entity? _defaultInstance;

  Entity_Entity whichEntity() => _Entity_EntityByTag[$_whichOneof(0)]!;
  void clearEntity() => clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  Player get player => $_getN(0);
  @$pb.TagNumber(2)
  set player(Player v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayer() => $_has(0);
  @$pb.TagNumber(2)
  void clearPlayer() => clearField(2);
  @$pb.TagNumber(2)
  Player ensurePlayer() => $_ensure(0);

  @$pb.TagNumber(3)
  Ball get ball => $_getN(1);
  @$pb.TagNumber(3)
  set ball(Ball v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBall() => $_has(1);
  @$pb.TagNumber(3)
  void clearBall() => clearField(3);
  @$pb.TagNumber(3)
  Ball ensureBall() => $_ensure(1);
}

class Move extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Move', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..e<Direction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: Direction.DIRECTION_NONE, valueOf: Direction.valueOf, enumValues: Direction.values)
    ..hasRequiredFields = false
  ;

  Move._() : super();
  factory Move({
    Direction? direction,
  }) {
    final _result = create();
    if (direction != null) {
      _result.direction = direction;
    }
    return _result;
  }
  factory Move.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Move.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Move clone() => Move()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Move copyWith(void Function(Move) updates) => super.copyWith((message) => updates(message as Move)) as Move; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Move create() => Move._();
  Move createEmptyInstance() => create();
  static $pb.PbList<Move> createRepeated() => $pb.PbList<Move>();
  @$core.pragma('dart2js:noInline')
  static Move getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Move>(create);
  static Move? _defaultInstance;

  @$pb.TagNumber(1)
  Direction get direction => $_getN(0);
  @$pb.TagNumber(1)
  set direction(Direction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearDirection() => clearField(1);
}

class AddEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddEntity', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..aOM<Entity>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entity', subBuilder: Entity.create)
    ..hasRequiredFields = false
  ;

  AddEntity._() : super();
  factory AddEntity({
    Entity? entity,
  }) {
    final _result = create();
    if (entity != null) {
      _result.entity = entity;
    }
    return _result;
  }
  factory AddEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEntity clone() => AddEntity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEntity copyWith(void Function(AddEntity) updates) => super.copyWith((message) => updates(message as AddEntity)) as AddEntity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddEntity create() => AddEntity._();
  AddEntity createEmptyInstance() => create();
  static $pb.PbList<AddEntity> createRepeated() => $pb.PbList<AddEntity>();
  @$core.pragma('dart2js:noInline')
  static AddEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEntity>(create);
  static AddEntity? _defaultInstance;

  @$pb.TagNumber(1)
  Entity get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity(Entity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  Entity ensureEntity() => $_ensure(0);
}

class UpdateEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateEntity', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..aOM<Entity>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entity', subBuilder: Entity.create)
    ..hasRequiredFields = false
  ;

  UpdateEntity._() : super();
  factory UpdateEntity({
    Entity? entity,
  }) {
    final _result = create();
    if (entity != null) {
      _result.entity = entity;
    }
    return _result;
  }
  factory UpdateEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEntity clone() => UpdateEntity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEntity copyWith(void Function(UpdateEntity) updates) => super.copyWith((message) => updates(message as UpdateEntity)) as UpdateEntity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateEntity create() => UpdateEntity._();
  UpdateEntity createEmptyInstance() => create();
  static $pb.PbList<UpdateEntity> createRepeated() => $pb.PbList<UpdateEntity>();
  @$core.pragma('dart2js:noInline')
  static UpdateEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEntity>(create);
  static UpdateEntity? _defaultInstance;

  @$pb.TagNumber(1)
  Entity get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity(Entity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  Entity ensureEntity() => $_ensure(0);
}

enum StreamRequest_Action {
  move, 
  notSet
}

class StreamRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StreamRequest_Action> _StreamRequest_ActionByTag = {
    1 : StreamRequest_Action.move,
    0 : StreamRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Move>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'move', subBuilder: Move.create)
    ..hasRequiredFields = false
  ;

  StreamRequest._() : super();
  factory StreamRequest({
    Move? move,
  }) {
    final _result = create();
    if (move != null) {
      _result.move = move;
    }
    return _result;
  }
  factory StreamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamRequest clone() => StreamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamRequest copyWith(void Function(StreamRequest) updates) => super.copyWith((message) => updates(message as StreamRequest)) as StreamRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamRequest create() => StreamRequest._();
  StreamRequest createEmptyInstance() => create();
  static $pb.PbList<StreamRequest> createRepeated() => $pb.PbList<StreamRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamRequest>(create);
  static StreamRequest? _defaultInstance;

  StreamRequest_Action whichAction() => _StreamRequest_ActionByTag[$_whichOneof(0)]!;
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Move get move => $_getN(0);
  @$pb.TagNumber(1)
  set move(Move v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMove() => $_has(0);
  @$pb.TagNumber(1)
  void clearMove() => clearField(1);
  @$pb.TagNumber(1)
  Move ensureMove() => $_ensure(0);
}

enum StreamResponse_Action {
  addEntity, 
  updateEntity, 
  notSet
}

class StreamResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StreamResponse_Action> _StreamResponse_ActionByTag = {
    1 : StreamResponse_Action.addEntity,
    2 : StreamResponse_Action.updateEntity,
    0 : StreamResponse_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pong.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AddEntity>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addEntity', subBuilder: AddEntity.create)
    ..aOM<UpdateEntity>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateEntity', subBuilder: UpdateEntity.create)
    ..hasRequiredFields = false
  ;

  StreamResponse._() : super();
  factory StreamResponse({
    AddEntity? addEntity,
    UpdateEntity? updateEntity,
  }) {
    final _result = create();
    if (addEntity != null) {
      _result.addEntity = addEntity;
    }
    if (updateEntity != null) {
      _result.updateEntity = updateEntity;
    }
    return _result;
  }
  factory StreamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamResponse clone() => StreamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamResponse copyWith(void Function(StreamResponse) updates) => super.copyWith((message) => updates(message as StreamResponse)) as StreamResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamResponse create() => StreamResponse._();
  StreamResponse createEmptyInstance() => create();
  static $pb.PbList<StreamResponse> createRepeated() => $pb.PbList<StreamResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamResponse>(create);
  static StreamResponse? _defaultInstance;

  StreamResponse_Action whichAction() => _StreamResponse_ActionByTag[$_whichOneof(0)]!;
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AddEntity get addEntity => $_getN(0);
  @$pb.TagNumber(1)
  set addEntity(AddEntity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddEntity() => clearField(1);
  @$pb.TagNumber(1)
  AddEntity ensureAddEntity() => $_ensure(0);

  @$pb.TagNumber(2)
  UpdateEntity get updateEntity => $_getN(1);
  @$pb.TagNumber(2)
  set updateEntity(UpdateEntity v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdateEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateEntity() => clearField(2);
  @$pb.TagNumber(2)
  UpdateEntity ensureUpdateEntity() => $_ensure(1);
}


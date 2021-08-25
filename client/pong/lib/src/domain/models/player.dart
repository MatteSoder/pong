import 'dart:convert';

class Player {
  final double x;
  final double y;

  Player(
    this.x,
    this.y,
  );

  factory Player.initial() => Player(0.0, 0.0);

  @override
  String toString() => 'Player ( x:$x, y:$y )';

  Player copyWith({
    double? x,
    double? y,
  }) {
    return Player(
      x ?? this.x,
      y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      map['x'],
      map['y'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Player && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

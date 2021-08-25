class Ball {
  final double x;
  final double y;

  Ball(
    this.x,
    this.y,
  );
  factory Ball.zero() => Ball(0.0, 0.0);

  Ball copyWith({
    double? x,
    double? y,
  }) {
    return Ball(x ?? this.x, y ?? this.y);
  }

  @override
  String toString() => 'Ball(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ball && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

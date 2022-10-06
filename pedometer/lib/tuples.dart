class Tuple3<T0, T1, T2> {
  final T0 d0;
  final T1 d1;
  final T2 d2;

  Tuple3(this.d0, this.d1, this.d2);
}

class Tuple4<T0, T1, T2, T3> {
  final T0 d0;
  final T1 d1;
  final T2 d2;
  final T3 d3;

  Tuple4(this.d0, this.d1, this.d2, this.d3);
}

class TimestampedMetrics {
  Tuple4<DateTime, num, num, num> data;
  TimestampedMetrics(DateTime timestamp, num n1, num n2, num n3): data = Tuple4(timestamp, n1, n2, n3);

  /// Returns a TimeseriesMetrics where the Timeaxis is copied and the other metrics are combined
  TimestampedMetrics operator +(TimestampedMetrics other) {
    return TimestampedMetrics(data.d0, data.d1 + other.data.d1, data.d2 + other.data.d2, data.d3 + other.data.d3);
  }

  /// Returns a Tuple3 ignoring the time axis
  Tuple3<num, num, num> operator /(num divisor) {
    return Tuple3(data.d1/divisor, data.d2/divisor, data.d3/divisor);
  }

  TimestampedMetrics map(Function(num) f) {
    return TimestampedMetrics(data.d0, f(data.d1), f(data.d1), f(data.d1));
  }
}
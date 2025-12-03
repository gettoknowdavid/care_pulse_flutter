import 'dart:ui';

final class SI {
  const SI._();

  static T? resolve<T>(Brightness brightness, T? light, T? dark) {
    return brightness == Brightness.light ? light : dark;
  }
}

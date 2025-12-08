final class SI {
  const SI._();

  static T resolve<T>(bool isRight, T right, T left) {
    return isRight ? right : left;
  }
}

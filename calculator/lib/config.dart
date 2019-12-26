

enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {

  static Flavor appFlavor;

  static String get message {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return 'RELEASE';
      case Flavor.DEVELOPMENT:
      default:
        return 'DEVELOPMENT';
    }
  }
}
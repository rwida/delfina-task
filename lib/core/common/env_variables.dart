enum Flavor { dev, test, stage, production }

class EnvVariables {
  EnvVariables._internal();
  static EnvVariables? _instance;

  Flavor flavor = Flavor.dev;
  static const String apiBaseDev = "https://api.unsplash.com";
  static const String apiBaseTesting = "https://api.unsplash.com";
  static const String apiBaseStage = "https://api.unsplash.com";
  static const String apiBaseProd = "https://api.unsplash.com";
  static const String stageType = String.fromEnvironment('env_type');

  String apiBaseUrl = '';

  static EnvVariables instance() {
    _instance ??= EnvVariables._internal();

    return _instance!;
  }

  void init() {
    _setFlavor();
  }

  bool isProduction() => _instance!.flavor == Flavor.production;

  bool isDevelopment() => _instance!.flavor == Flavor.dev;

  bool isTesting() => _instance!.flavor == Flavor.test;

  void _setFlavor() {
    switch (stageType) {
      case 'dev':
        flavor = Flavor.dev;
        apiBaseUrl = apiBaseDev;
        break;
      case 'prod':
        flavor = Flavor.production;
        apiBaseUrl = apiBaseProd;
        break;
      case 'test':
        flavor = Flavor.test;
        apiBaseUrl = apiBaseTesting;
        break;
      case 'stage':
        flavor = Flavor.stage;
        apiBaseUrl = apiBaseStage;
        break;
      default:
        flavor = Flavor.dev;
        apiBaseUrl = apiBaseDev;
    }
  }
}

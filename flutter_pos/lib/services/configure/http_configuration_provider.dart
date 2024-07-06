import '../../common/env.dart';

class HttpConfigurationProvider {

  String getBaseApiUrl () {
    return (IS_ENV == PROD) ? PROD_API_URL : DEV_API_URL;
  }

  String getApiKey () {
    return (IS_ENV == PROD) ? PROD_API_KEY : DEV_API_KEY;
  }

}
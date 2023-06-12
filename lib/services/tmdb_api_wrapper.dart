import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';

void fetchMovie() async {
  // Acceder a las variables de entorno
  // String? unsafeApiKey = dotenv.env['API_KEY'];
  // String apiKey = unsafeApiKey ?? '';

  var url = Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=iron%20man&include_adult=true&language=en-US&page=1');
  var headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer API_KEY'
  };
  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

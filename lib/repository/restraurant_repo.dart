import 'dart:convert';
import 'package:http/http.dart' as http;
import '../helpers/helper.dart';
import '../models/restraurantData.dart';

Future get_res_data() async {

  try{
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', Uri.parse(
        'https://jexmovers.com/secured/restaurants/public/api/test/restaurants?api_token=FxJhtUE040fZRQ7m8JbhvN3TjHA7vxiJGKNFThNu7iLuBTdXNSyBTx2mATCw&myLon=72.5463&myLat=23.0830&areaLon=72.5463&areaLat=23.0830&with=MerchantDiscount&orderBy=area&searchFields=status:=&search=status:1&random=3&pagination=5&page=1&merchant_only'
    )));

    print('Answer: ${streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data as Map<String, dynamic>))
        .expand((data) => (data as List))
        .map((data) {
      return Restraurant.fromJSON(data);
    })}');

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data as Map<String, dynamic>))
        .expand((data) => (data as List))
        .map((data) {
      return Restraurant.fromJSON(data);
    });
  }
  catch(e){
    e.toString();
  }
}
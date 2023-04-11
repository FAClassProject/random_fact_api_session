import 'dart:convert';

import 'package:http/http.dart'as http;
class APICall{
  //int num = 0;

  Future<String?> getRandomFact()async{

    var response =
    await http.get(Uri.parse("https://catfact.ninja/facts"));
    print("Printing response $response");
    String result = jsonDecode(response.body)['data'][0]['fact'];
    print("printing Fact Object+++++++++++++++ $result");
    return result;
  }
}
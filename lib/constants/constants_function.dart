import 'dart:convert';
import 'package:http/http.dart' as http;
class ConstantFunction{


  static Future<List<Map<String, dynamic>>> getResponse(String findRecipe) async{
    String id='5bc6ea8f';
    String key= '368d72e4728e4e3464419974afdb8b8d';

    String api='https://api.edamam.com/search?q=$findRecipe&app_id=$id&app_key=$key&from=0&to=30';
    final response = await http.get(Uri.parse(api));
    List<Map<String, dynamic>> recipe=[];
    if(response.statusCode==200){
      var data = jsonDecode(response.body);

      if(data['hits'] != null){
        for(var hit in data['hits']){
          recipe.add(hit['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }
}
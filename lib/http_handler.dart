import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_api/photo_class.dart';
//كاملة عبد الهادي الرفاعي & فاطمة خفاجي
class HTTPHandler{
  String url = "https://jsonplaceholder.typicode.com/photos" ;
  Future<List<Photo>> fetchData()async{
    List<Photo> myList =[];
    final respond = await http.get(Uri.parse(url));
    if(respond.statusCode==200)
    {
      var data = jsonDecode(respond.body);
      for(Map<String , dynamic> d in data){
        Photo photo = Photo.fromJSON(d);
        myList.add(photo) ;
      }
      return myList;
    }
    else{
      throw Exception('${respond.statusCode}');
    }
  }
}
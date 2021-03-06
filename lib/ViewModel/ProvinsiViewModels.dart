import 'package:tesmahasiswa/Model/Provinsi.dart';
import 'package:tesmahasiswa/Network/ApiClient.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ProvinsiViewModels {
  static Future<Provinsi> getProv(String id) async {
    // future is used to handle the error when calling api > Future + async or await
//    var configandro = new Configandro();
    ApiClient apiClient = new ApiClient();
//    ApiConfig apiConfig = new ApiConfig();
    var data;
    var dan = '&';

    if(id==null||id.isEmpty){
      data = await http.get(apiClient.getBaseUrl()+"Mahasiswa/prov", headers: {
        'Accept': 'application/json',
      });
    }else{
      var materiget = 'id='+id;
      data = await http.get(apiClient.getBaseUrl()+"Mahasiswa/prov?"+materiget, headers: {
        'Accept': 'application/json',
      });
    }


//    final data2 = artikelFromJson(data.body);
    print('Cek Data Provinsi: '+data.body);
    return provinsiFromJson(data.body);

  }

}
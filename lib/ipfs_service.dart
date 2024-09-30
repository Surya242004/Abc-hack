import 'package:http/http.dart' as http;
import 'dart:convert';

class IPFSService {
  static const String ipfsUrl = "https://ipfs.infura.io:5001/api/v0/add";

  static Future<String> uploadToIPFS(String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse(ipfsUrl));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    var response = await request.send();
    var responseData = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(responseData.body);
      return jsonData['Hash'];
    } else {
      throw Exception("Failed to upload file to IPFS");
    }
  }
}

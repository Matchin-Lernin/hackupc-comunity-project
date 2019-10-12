import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LocalScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  String _localId="";
  String _email = "";
  String _music = "";

  // In the constructor, require a Todo.
  LocalScreen(String localId, String email, String musica){
    this._localId = localId;
    this._email = email;
    this._music = musica;
  }

  @override
  Widget build(BuildContext context) {
    _makeGetRequest(_localId);
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(_localId),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(_localId),
      ),
    );
  }

   _makeGetRequest(String idLocal) async {
    // make GET request
    var newMusic = _music.replaceAll(new RegExp(r'\s*,\s*'), '-').replaceAll(new RegExp(r'(\s|\-)+'), '_').replaceAll(new RegExp(r'\s*,\s*'), '-');
    print(newMusic);
    String url = 'http://04f46746.ngrok.io/add/$_email/$_localId/$newMusic';
    get(url);
  }
}
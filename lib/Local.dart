import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Scanner.dart';


class LocalScreen extends StatefulWidget {
  String _localId="";
  String _nickname = "";
  String _music = "";

  // In the constructor, require a Todo.
  LocalScreen(String localId, String nickname, String musica){
    this._localId = localId;
    this._nickname = nickname;
    this._music = musica;
  }
@override
  State<StatefulWidget> createState() => new LocalScreenState(_localId, _nickname, _music);
}

class LocalScreenState extends State<LocalScreen> {
  // Declare a field that holds the Todo.
  String _localId="";
  String _nickname = "";
  String _music = "";

  // In the constructor, require a Todo.
  LocalScreenState(String localId, String nickname, String musica){
    this._localId = localId;
    this._nickname = nickname;
    this._music = musica;
  }

  @override
  Widget build(BuildContext context) {
    _enterInLocal();
    return new Scaffold(
      appBar: _buildBar(context),
      body: new ListView(
        padding: EdgeInsets.all(20.0),
          children: 
          <Widget>[
            SizedBox(height: 50),
            Image(image: AssetImage("assets/images/musiQ.png")),
            SizedBox(height: 20),
            _buildButtons(),
          ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Text(
            'You are in local HackUPC. Have a good time listening ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          new RaisedButton(
            child: new Text('Good bye!'),
            onPressed: _exitLocal,
          ),
        ],
      ),
    );
  } 

  _enterInLocal() async {
    // make GET request
    var newMusic = _music.replaceAll(new RegExp(r'(\s|\-)+'), '_').replaceAll(new RegExp(r','), '-');
    print(newMusic);
    String url = 'http://1fae30f6.ngrok.io/add/$_nickname/$_localId/$newMusic/';
    get(url);
  }

  void _exitLocal () {
    _exitLocalAction();
    print('The user wants to login with $_nickname and $_music');
    Navigator.pop(context);
  }

  _exitLocalAction() async {
    // make GET request
    String url = 'http://1fae30f6.ngrok.io/exit/$_nickname/$_localId/';
    get(url);
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      leading: new Container(),
      title: new Text("MusiQ"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }
  
}
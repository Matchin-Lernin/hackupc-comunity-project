import 'package:flutter/material.dart';
import 'Scanner.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final TextEditingController _nicknameFilter = new TextEditingController();
  final TextEditingController _musicFilter = new TextEditingController();
  String _nickname = "";
  String _music = "";

  _LoginPageState() {
    _nicknameFilter.addListener(_nicknameListen);
    _musicFilter.addListener(_musicListen);
    _musicFilter.addListener(_musicListen);
  }

  void _nicknameListen() {
    if (_nicknameFilter.text.isEmpty) {
      _nickname = "";
    } else {
      _nickname = _nicknameFilter.text;
    }
  }

  void _musicListen() {
    if (_musicFilter.text.isEmpty) {
      _music = "";
    } else {
      _music = _musicFilter.text;
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new ListView(
        padding: EdgeInsets.all(20.0),
          children: 
          <Widget>[
            SizedBox(height: 50),
            Image(image: AssetImage("assets/images/musiQ.png")),
            SizedBox(height: 100),
            _buildTextFields(),
            SizedBox(height: 20),
            _buildButtons(),
          ],
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("MusiQ"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: _nicknameFilter,
              decoration: new InputDecoration(
                labelText: 'NickName'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _musicFilter,
              decoration: new InputDecoration(
                labelText: 'Tracks you love <3, separated by comma'
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Enter!'),
            onPressed: _loginPressed,
          ),
        ],
      ),
    );
  } 
  

  // These functions can self contain any user auth logic required, they all have access to _nickname and _music

  void _loginPressed () {
    print('The user wants to login with $_nickname and $_music');
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Scanner(_nickname, _music)),);
  }
}
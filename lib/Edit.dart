import 'package:flutter/material.dart';
import 'package:hackupc19/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EditPageState();
}


class _EditPageState extends State<EditPage> {

  String _email = "";
  String _password = "";
  String _music = "";
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _musicFilter = new TextEditingController();  

  _EditPageState() {
    _load();
    _emailFilter.addListener(_emailListen);
    _emailFilter.text=_email;
    _passwordFilter.addListener(_passwordListen);
    _passwordFilter.text=_password;
    _musicFilter.addListener(_musicListen);
    _musicFilter.text=_music;
    
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

   void _musicListen() {
    if (_musicFilter.text.isEmpty) {
      _music = "";
    } else {
      _music = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Simple Login Example"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
      return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                labelText: 'Password'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _musicFilter,
              decoration: new InputDecoration(
                labelText: 'Music'
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
              child: new Text('Edit profile'),
              onPressed: _editAccountPressed,
              //TODO: ojo aquí
            ),
            new FlatButton(
              child: new Text('Logout?'),
              onPressed: _logoutPressed,
            )
          ],
        ),
      );
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _logoutPressed () {
    print('The user wants to login with $_email and $_password');
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),);
  }


  void _editAccountPressed () {
    print('The user wants to create an accoutn with $_email and $_password');
    _save();
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", _email);
    prefs.setString("password", _password);
    prefs.setString("music", _music);

    print('saved user $_email');
  }

   _load() async {
    final prefs = await SharedPreferences.getInstance();
    _email = prefs.getString("email") ?? 0;
    _password = prefs.getString("password") ?? 0;
    _music = prefs.getString("music") ?? 0;
    print('read user: $_email');
  }

}
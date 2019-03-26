/**
 * canLaunch(url)，能够检查链接是否有效
 * 它会先检查url字符串是否为空再通过MethodChannel调用原生，并通过返回一个bool
 *该demo直接来自于pub
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class UrlLauncherDemo extends StatefulWidget {
  @override
  _UrlLauncherDemoState createState() => _UrlLauncherDemoState();
}

class _UrlLauncherDemoState extends State<UrlLauncherDemo> {
  Future<Null> _launched;

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Null> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<Null> snapshot) {
    if (snapshot.hasError) {
      return  Text('Error: ${snapshot.error}');
    } else {
      return const Text('成功');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String url = 'https://www.baidu.com';

    return  Scaffold(
      appBar:  AppBar(
        title:  Text("url launcher demo"),
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             RaisedButton(
              onPressed: () => setState(() {
                _launched = _launchInBrowser(url);
              }),
              child: const Text('Launch in browser'),
            ),
             Padding(padding:  EdgeInsets.all(16.0)),
             RaisedButton(
              onPressed: () => setState(() {
                _launched = _launchInWebViewOrVC(url);
              }),
              child: const Text('Launch in app'),
            ),
             Padding(padding:  EdgeInsets.all(16.0)),
             FutureBuilder<Null>(future: _launched, builder: _launchStatus),
          ],
        ),
      ),
    );
  }
}

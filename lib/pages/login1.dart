
//import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://flutter.dev/";
  StreamSubscription<String> _onUrlChanged;

//  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  //final flutterWebviewPlugin = new FlutterWebviewPlugin();

         //  flutterWebviewPlugin.onUrlChanged.listen((String url) {


   //});
 // StreamSubscription<WebViewStateChanged> _onchanged; // here we checked the url state if it loaded or start Load or abort Load
final flutterWebviewPlugin = new FlutterWebviewPlugin();
 
//flutterWebviewPlugin.onUrlChanged.listen((String url) {

//});
  @override
  void initState() {
    super.initState();
     flutterWebviewPlugin.onUrlChanged.listen((String url) {
       print(url);
       print("url");
       print("url"+url);
        if (mounted) {
        setState(() {
          print("URL changed: $url");
          if(url == "https://flutter.dev/docs/get-started/install/linux"){
           /*  Navigator.of(context).pushNamedAndRemoveUntil(
                "/home", (Route<dynamic> route) => false);
                */
                 /* Navigator.pushNamed(
              context,
              '/aboutus',
            );*/
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/aboutus", (Route<dynamic> route) => false);
            flutterWebviewPlugin.close();
            //flutterWebviewPlugin.close();

          }

        });
        }
 });
   // currentUrl = await  flutterWebviewPlugin.currentUrl()
    /*_onchanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        if(state.type== WebViewState.finishLoad){ // if the full website page loaded
          print("loaded...");
        }else if (state.type== WebViewState.abortLoad){ // if there is a problem with loading the url
          print("there is a problem...");
        } else if(state.type== WebViewState.startLoad){ // if the url started loading
          print("start loading...");
        }
      }
    });*/



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin.dispose(); // disposing the webview widget 
  }



  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withJavascript: false, // run javascript
      withZoom: false, // if you want the user zoom-in and zoom-out
      hidden: true , // put it true if you want to show CircularProgressIndicator while waiting for the page to load

        appBar: AppBar(
        title: Text("Flutter"),
        centerTitle: false,
        elevation: 1, // give the appbar shadows
        iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.refresh),
              onTap: (){
                flutterWebviewPlugin.reload();
                // flutterWebviewPlugin.reloadUrl(); // if you want to reloade another url
              },
            ),

            InkWell(
              child: Icon(Icons.stop),
              onTap: (){
                flutterWebviewPlugin.stopLoading(); // stop loading the url
              },
            ),

            InkWell(
              child: Icon(Icons.remove_red_eye),
              onTap: (){
               // flutterWebviewPlugin.show(); // appear the webview widget
                //  flutterWebviewPlugin.hide(); // hide the webview widget
                  //flutterWebviewPlugin.close();
                //  print(flutterWebviewPlugin.currentUrl())
                   Navigator.pop(context,true);
              },
            ),

            InkWell(
              child: Icon(Icons.close),
              onTap: (){
                flutterWebviewPlugin.hide(); // hide the webview widget
              },
            ),

            InkWell(
              child: Icon(Icons.arrow_back),
              onTap: (){
                flutterWebviewPlugin.goBack(); // for going back
              },
            ),

            InkWell(
              child: Icon(Icons.forward),
              onTap: (){
                flutterWebviewPlugin.goForward(); // for going forward
              },
            ),

          ],

      ),


    initialChild: Container( // but if you want to add your own waiting widget just add InitialChild
        color: Colors.white,
        child: const Center(
        child: Text('waiting...'),
    ),)


    );
  }
}
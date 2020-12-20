
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
 // var urlString = "https://retailer-webapp.s3.amazonaws.com/index.html";
 // String urlString = "https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction&encRequest=c3c7379b8bf4226f3998d0bfaf3e24badc90d8b9030736bfbfdfe3e6e5343e09a023f61eb081efceb8fb38bb5c5e8efc1cba76f305f0e4c678bb0e22aa91869a5676e846ab5699b2bd77c3d4fe6b662ee98868262994f1be72043ddfe7372a96290f15f74a3aa590344168bfbb5d883ca8cd15a3df7d840f1abab451eb4b9aaefe9f8c0fe67172e87d32742e6a1e3f220d50f0f813fee32c6bdf44d3e89937c81056d0da5aa91d3240312bfd98129ebdf158c81bba4bbdce5559ba3df6b36a23feb45436ddf18a5a342ed6c9bb9d3948cdf85e3fed38ecb77ebe98a04b2bdcd40e83d5e28caf07b34e589e202d41b8bc4fa7a15d3f965ae894d5324e9c34d3fd4738ccb75ec822d829be1cbcf24134cd&access_code=AVEE94HH13AR09EERA";
  String urlString = "https://mretailer.mymarketblr.com/";
  //final Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

  /*launchUrl() {
    setState(() {

      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
      ok
      
    });
  }*/

  @override
  void initState() {
    super.initState();
    print("reddy testing");
    _getCurrentLocation();
//SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }
  _getCurrentLocation()async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      this.setState(() {
         // urlString =   prefs.getString('url');
        
      });
    
    print("_currentPosition");
    final Geolocator geolocator = Geolocator();
    // ..forceAndroidLocationManager;
    /*LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);
    StreamSubscription positionStream = geolocator.getPositionStream(locationOptions).listen(
            (Position position) {
          // _currentPosition = position;
          print("position");
          print(position);


        });*/

    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position)async {
      /*  setState(() {
        print("position1");
        print(position);
        print(position.latitude);
        print(position.longitude);
       try {
          List<Placemark> p = await geolocator.placemarkFromCoordinates(
              position.latitude, position.longitude);

          Placemark place = p[0];

          setState(() {

            print("${place.locality}, ${place.postalCode}, ${place.country},${place.name},${place.subLocality}");
          });
        } catch (e) {
          print(e);
        }
       /* _currentPosition = position;
        print("_currentPosition");
        print(_currentPosition);
        getUserLocation1(_currentPosition.latitude,_currentPosition.longitude);
        //getUserLocation1(13.0261,80.0164);
        _getAddressFromLatLng();*/
      });*/
      print("position1");
      print(position);
      print(position.latitude);
      print(position.longitude);
      print(position.latitude.runtimeType);
      print(position.longitude.runtimeType);
      try {
        List<Placemark> p = await geolocator.placemarkFromCoordinates(
          //14.4426,79.9865);
            position.latitude, position.longitude);

        Placemark place = p[0];
        print("${place.locality}, ${place.postalCode}, ${place.country},${place.name},${place.subLocality}");
        print("${place.locality.runtimeType}, ${place.postalCode.runtimeType}, ${place.country.runtimeType},${place.name.runtimeType},${place.subLocality.runtimeType}");
       // SharedPreferences prefs = await SharedPreferences.getInstance();
      //  prefs.setString('userChoosedLat', position.latitude.toString());//set userChoosedLat to (Current Location lat)
        // prefs.setString('userChoosedLat', "14.4426");//set userChoosedLat to (Current Location lat)
       // prefs.setString('userChoosedLang', position.longitude.toString());//set userChoosedLang  to (Current Location long)
        //prefs.setString('userChoosedLang',"79.9865");//set userChoosedLang  to (Current Location long)
        //  prefs.setString('userChoosedPincode', place.postalCode);//set userChoosedPincode  to  (Current Location pincode)
      //  prefs.setString('userChoosedPincode', "123456");//set userChoosedPincode  to  ("123456 because pincode is optional for api now")
        //  prefs.setString('userChoosedPincode', "524001");//set userChoosedPincode  to  (Current Location pincode)
        // prefs.setString('userChoosedSublocality', "Nellore");//set userChoosedPincode  to  (Current Location pincode)
        //  return;






        /* setState(() {

          print("${place.locality}, ${place.postalCode}, ${place.country},${place.name},${place.subLocality}");
          SharedPreferences prefs = await SharedPreferences.getInstance();

        });*/
      } catch (e) {
        print(e);
      }

    }).catchError((e) {
      print(e);
    });
  }


  @override
  Widget build(BuildContext context) {
   

   return SafeArea(
     child:WebviewScaffold(
    /* appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: controller,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Url Here",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => launchUrl(),
          )
        ],
      ),
      */
         url: urlString,
         withZoom: false,
         geolocationEnabled:true,
         withJavascript: true,
         withLocalStorage:true,
    ),
  
   );
   
  }
}





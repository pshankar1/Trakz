// ignore_for_file: duplicate_import

import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/crossfade_state.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/crossfade_state.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import 'widgets/sized_icon_button.dart';

class spotifySign extends StatefulWidget {
  const spotifySign({Key? key}) : super(key: key);

  @override
  _spotifySignState createState() => _spotifySignState();
}

class _spotifySignState extends State<spotifySign> {
  bool _loading = false;
  bool _connected = false;
  late String result;

  final Logger _logger = Logger(
    //filter: CustomLogFilter(), // custom logfilter can be used to have logs in release mode
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true,
    ),
  );
  CrossfadeState? crossfadeState;
  late ImageUri? currentTrackImageUri;

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: StreamBuilder<ConnectionStatus>(
  //       stream: SpotifySdk.subscribeConnectionStatus(),
  //       builder: (context, snapshot) {
  //         _connected = false;
  //         var data = snapshot.data;
  //         if (data != null) {
  //           _connected = data.connected;
  //         }
  //         return Scaffold(
  //           appBar: AppBar(
  //             title: const Text('Spotify Sign in'),
  //             actions: [
  //               _connected
  //                   ? IconButton(
  //                       onPressed: disconnect,
  //                       icon: const Icon(Icons.exit_to_app),
  //                     )
  //                   : Container()
  //             ],
  //           ),
  //           // body: _sampleFlowWidget(context),
  //           // bottomNavigationBar: _connected ? _buildBottomBar(context) : null,
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget _sampleFlowWidget(BuildContext context2) {
  //   return Stack(
  //     children: [
  //       ListView(
  //         padding: const EdgeInsets.all(8),
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               TextButton(
  //                 onPressed: connectToSpotifyRemote,
  //                 child: const Icon(Icons.settings_remote),
  //               ),
  //               TextButton(
  //                 onPressed: authenticate,
  //                 child: const Text('Authentication'),
  //               ),
  //             ],
  //           ),
  //           const Divider(),
  //           const Text(
  //             'Player State',
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),

  //           const Divider(),
  //           const Text(
  //             'Player Context',
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),

  //           const Divider(),
  //           const Text(
  //             'Player Api',
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),

  //           const Divider(),
  //           const Text(
  //             'Crossfade State',
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),

  //           // ignore: prefer_single_quotes
  //           Text("Is enabled: ${crossfadeState?.isEnabled}"),
  //           // ignore: prefer_single_quotes
  //           Text("Duration: ${crossfadeState?.duration}"),
  //         ],
  //       ),
  //       _loading
  //           ? Container(
  //               color: Colors.black12,
  //               child: const Center(child: CircularProgressIndicator()))
  //           : const SizedBox(),
  //     ],
  //   );
  // }

  Future<void> disconnect() async {
    try {
      setState(() {
        _loading = true;
      });
      var result = await SpotifySdk.disconnect();
      setStatus(result ? 'disconnect successful' : 'disconnect failed');
      setState(() {
        _loading = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        _loading = false;
      });
      setStatus(e.code, message: e.message);
    } on MissingPluginException {
      setState(() {
        _loading = false;
      });
      setStatus('not implemented');
    }
  }

  Future<void> connectToSpotifyRemote() async {
    try {
      setState(() {
        _loading = true;
      });
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: dotenv.env['CLIENT_ID'].toString(),
          redirectUrl: dotenv.env['REDIRECT_URL'].toString());
      setStatus(result
          ? 'connect to spotify successful'
          : 'connect to spotify failed');
      setState(() {
        _loading = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        _loading = false;
      });
      setStatus(e.code, message: e.message);
    } on MissingPluginException {
      setState(() {
        _loading = false;
      });
      setStatus('not implemented');
    }
  }

  // Future<String> getAccessToken() async {
  //   try {
  //     var authenticationToken = await SpotifySdk.getAuthenticationToken(
  //         clientId: dotenv.env['CLIENT_ID'].toString(),
  //         redirectUrl: dotenv.env['REDIRECT_URL'].toString(),
  //         scope: 'app-remote-control, '
  //             'user-modify-playback-state, '
  //             'playlist-read-private, '
  //             'playlist-modify-public,user-read-currently-playing');
  //     setStatus('Got a token: $authenticationToken');
  //     return authenticationToken;
  //   } on PlatformException catch (e) {
  //     setStatus(e.code, message: e.message);
  //     return Future.error('$e.code: $e.message');
  //   } on MissingPluginException {
  //     setStatus('not implemented');
  //     return Future.error('not implemented');
  //   }
  // }

  Future<String> authenticate() async {
    final callbackUrlScheme = 'trakz';
// Construct the url
    final url = Uri.https('accounts.spotify.com', '/authorize', {
      'response_type': 'code',
      'client_id': 'fe57c1ebb2544268b21d17d614e449fe',
      'redirect_uri': 'trakz://callback/',
      'scope': 'user-read-email',
    });
    try {
      print(url);
      result = await FlutterWebAuth.authenticate(
          url: url.toString(), callbackUrlScheme: callbackUrlScheme);
      print("Got Result ");
    } on PlatformException catch (e) {
      print("Got Error ");
      ;
    }
    return result;
  }

  Future getPlayerState() async {
    try {
      return await SpotifySdk.getPlayerState();
    } on PlatformException catch (e) {
      setStatus(e.code, message: e.message);
    } on MissingPluginException {
      setStatus('not implemented');
    }
  }

  void setStatus(String code, {String? message}) {
    var text = message ?? '';
    _logger.i('$code$text');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

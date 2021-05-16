import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _LoginState(),
      //Login(title: 'app_test'),
      //YoutubeAppDemo()

      initialRoute: '/',
      routes: {
        // '/': (context) => _LoginState(),
        '/Home': (context) => Home(),
        '/Tab1': (context) => Tab1(),
        '/Tab2': (context) => Tab2(),
        '/Tab3': (context) => Tab3(),
      },
    );
  }
}

// class Login extends StatefulWidget {
//   Login({required Key key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _LoginState createState() => _LoginState();
// }

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
}

class _LoginState extends StatelessWidget {
  //State<Login> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  // login
                },
                child: Text('Login with Google')),
            OutlinedButton(onPressed: () {}, child: Text('Login with Apple')),
            OutlinedButton(onPressed: () {}, child: Text('Login with Email')),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/Home');
                },
                child: Text('Home')),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, '/Tab1');
                },
                child: Text('Play the video')),
            OutlinedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, '/Tab2');
                },
                child: Text('Input the answer')),
            OutlinedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, '/Tab3');
                },
                child: Text('Record your voice')),
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab 1')),
      body: Text('[video here]'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tab 2')), body: Text('[poll here]'));
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tab 3')), body: Text('[voice input here]'));
  }
}

// class YoutubeAppDemo extends StatefulWidget {
//   @override
//   _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
// }

// class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: 'tcodrIK2P_I',
//       params: const YoutubePlayerParams(
//         playlist: [
//           'nPt8bK2gbaU',
//           'K18cpp_-gP8',
//           'iLnmTe5Q2Qw',
//           '_WoCV4c6XOE',
//           'KmzdUe0RSJo',
//           '6jZDSSZZxjQ',
//           'p2lYr3vM_1w',
//           '7QUtEmBT_-w',
//           '34_PXCzGw1M',
//         ],
//         startAt: const Duration(minutes: 1, seconds: 36),
//         showControls: true,
//         showFullscreenButton: true,
//         desktopMode: true,
//         privacyEnhanced: true,
//         useHybridComposition: true,
//       ),
//     );
//     _controller.onEnterFullscreen = () {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//       log('Entered Fullscreen');
//     };
//     _controller.onExitFullscreen = () {
//       log('Exited Fullscreen');
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const player = YoutubePlayerIFrame();
//     return YoutubePlayerControllerProvider(
//       // Passing controller to widgets below.
//       controller: _controller,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Youtube Player IFrame'),
//         ),
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             if (kIsWeb && constraints.maxWidth > 800) {
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Expanded(child: player),
//                   const SizedBox(
//                     width: 500,
//                     child: SingleChildScrollView(
//                       // child: Controls(),
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return ListView(
//               children: [
//                 player,
//                 // const Controls(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }
// }
//
// class Controls extends StatelessWidget {
//   const Controls();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _space,
//           MetaDataSection(),
//           _space,
//           SourceInputSection(),
//           _space,
//           PlayPauseButtonBar(),
//           _space,
//           VolumeSlider(),
//           _space,
//           PlayerStateSection(),
//         ],
//       ),
//     );
//   }
//
//   Widget get _space => const SizedBox(height: 10);
// }

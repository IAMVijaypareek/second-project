import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends AnimatedWidget {
  WelcomeWidget({this.remoteConfig}) : super(listenable: remoteConfig);

  final RemoteConfig remoteConfig;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: remoteConfig.getBool('welcome')
              ? Container(
                
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  decoration: BoxDecoration(
                    
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    'Compound can now share songs directly from Play Music',
                    textAlign: TextAlign.center,
                  ),
                )
              : Text('${remoteConfig.getString('welcome')}')),
      /*floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () async {
            try {
              // Using default duration to force fetching from remote server.
              await remoteConfig.fetch(expiration: const Duration(seconds: 0));
              await remoteConfig.activateFetched();
            } on FetchThrottledException catch (exception) {
              // Fetch throttled.
              print(exception);
            } catch (exception) {
              print(
                  'Unable to fetch remote config. Cached or default values will be '
                  'used');
            }
          }),*/
    );
  }
}

Future<RemoteConfig> setupRemoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  // Enable developer mode to relax fetch throttling
  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
  remoteConfig.setDefaults(<String, dynamic>{
    'welcome': '',
    'hello': 'default hello',
  });
  try {
    // Using default duration to force fetching from remote server.
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
  return remoteConfig;
}

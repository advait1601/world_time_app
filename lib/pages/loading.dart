import 'package:flutter/material.dart';
import 'package:world_time_app/classes/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map data = {};

  void setUpWorldTime(String location, String flag, String url) async {
    //this function will create an instance of the WorldTime class and get the time corresponding to the chosen location
    WorldTime obj = WorldTime(location: location, flag: flag, url: url);
    await obj.getTime();
    //once we have fetched the time, we have to redirect to the home page
    //also, the home page currently does not have access to the data to be displayed
    //we therefore need to pass the required values to the home page
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'timeOfDay': obj.timeOfDay
    });
  }

  @override
  Widget build(BuildContext context) {

    //this is where we receive the arguments sent from the choose location screen
    //we are storing the arguments in the form of a map
    data = ModalRoute.of(context)!.settings.arguments as Map;
    setUpWorldTime(data['location'], data['flag'], data['url']);

    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.lightBlueAccent,
          size: 50.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //this is where we receive the arguments sent from the loading screen
    //we are storing the arguments in the form of a map
    data = ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = '';
    if (data['timeOfDay'] == 'morning') {
      bgImage = 'assets/morning1.avif';
    }
    else if (data['timeOfDay'] == 'noon') {
      bgImage = 'assets/noon1.avif';
    }
    else if (data['timeOfDay'] == 'evening') {
      bgImage = 'assets/evening1.avif';
    }
    else {
      bgImage = 'assets/night1.avif';
    }

    final Color textColor;
    if (data['timeOfDay'] == 'night') {
      textColor = Colors.white;
    }
    else {
      textColor = Colors.black;
    }

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  //clicking this button should redirect us to '/location' route
                  //Navigator.pushNamed() function pushes the route passed, on top of the current screen
                  //clicking the back arrow will pop the current screen from the stack and now the screen underneath will be visible
                  Navigator.pushNamed(context, '/');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.location_pin,
                      color: textColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(data['flag']),
                    height: 30.0,
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    data['location'], //current location
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                data['time'], //current time at above location
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

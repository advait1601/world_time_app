import 'package:flutter/material.dart';
import 'package:world_time_app/classes/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  List<WorldTime> list = [
    WorldTime(location: 'Pyongyang', flag: 'flags/north_korea_circle_flag.png', url: 'Asia/Pyongyang'),
    WorldTime(location: 'Bishkek', flag: 'flags/kyrgyzstan_circle_flag.png', url: 'Asia/Bishkek'),
    WorldTime(location: 'Hovd', flag: 'flags/mongolia_circle_flag.png', url: 'Asia/Hovd'),
    WorldTime(location: 'Istanbul', flag: 'flags/turkey_circle_flag.webp', url: 'Asia/Istanbul'),
    WorldTime(location: 'Uralsk', flag: 'flags/kazakhstan_circle_flag.webp', url: 'Asia/Oral'),
    WorldTime(location: 'Jamaica', flag: 'flags/jamaica_circle_flag.webp', url: 'America/Jamaica'),
    WorldTime(location: 'Maputo', flag: 'flags/mozambique_circle_flag.webp', url: 'Africa/Maputo'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Choose Location',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        //ListViewBuilder is going to use this function for every single item of the list of locations
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/loading', arguments: {
                  'location': list[index].location,
                  'flag': list[index].flag,
                  'url': list[index].url
                });
              },
              title: Text(
                list[index].location,
              ),
              leading: Image(
                image: AssetImage(list[index].flag),
                height: 30.0,
                width: 30.0,
              ),
            ),
          );
        },
      ),
    );
  }
}

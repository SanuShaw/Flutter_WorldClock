import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty?ModalRoute.of(context).settings.arguments:data;
    // set background image
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    print("data :$data");
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDaytime': result['isDayTime']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[300],
                  ),),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  child: Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 42.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(data['time'], style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

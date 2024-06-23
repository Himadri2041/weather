import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/detail_screen.dart';

class User {
  final String Name;
  
  final String email_address;
  final String city;
  User({
    required this.Name,
    
    required this.email_address,
    required this.city,
  });
}

class userpage extends StatefulWidget {
  userscreen createState() => userscreen();
  
}

class userscreen extends State<userpage> {
  final TextEditingController _nameController = TextEditingController();
  
  final TextEditingController _emailaddress = TextEditingController();
  final TextEditingController _city = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('userName') ?? '';
      _emailaddress.text = prefs.getString('emailaddress') ?? '';
      _city.text = prefs.getString('city') ?? '';
    });
  }

  Future<void> _saveUserData(String name, String emailaddress,String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('emailaddress', emailaddress);
    await prefs.setString('city', city);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 26, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailpage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Padding(

          padding: const EdgeInsets.all(16.0),
        
          child:
        
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20),


            TextField(
                controller: _emailaddress,
                decoration: InputDecoration(
                  labelText: 'Enter your email address',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _city,
                decoration: InputDecoration(
                  labelText: 'Enter your city',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                 _saveUserData(_nameController.text, _emailaddress.text,_city.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('User profile saved')),
                );
              }, child: Text('Save your profile'),),
              SizedBox(height:20),           
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${_nameController.text}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'email address: ${_emailaddress.text}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'City: ${_city.text}',
                  style: TextStyle(fontSize: 18),
                  ),
              ],
            ),                       
                                      ],
                                    ),

     )     
          );
    
  }
}

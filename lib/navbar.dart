import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  String _coachName = '';

  final List<Widget> _widgetOptions = <Widget>[
    Text('Exercise Library Page', style: TextStyle(color: Colors.white)),
    Text('Templates Page', style: TextStyle(color: Colors.white)),
    Text('Athlete Overview Page', style: TextStyle(color: Colors.white)),
    Text('Athlete List Page', style: TextStyle(color: Colors.white)),
    Text('Chat Page', style: TextStyle(color: Colors.white)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCoachName();
  }

  Future<void> _loadCoachName() async {
    // Load coach name from Firebase or any other data source
    // Replace the code below with your own implementation
    await Future.delayed(
        Duration(seconds: 2)); // Simulating asynchronous operation
    setState(() {
      _coachName = 'Salah lashein';
    });
  }

  void _showAddAthleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String athleteEmail = '';
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: 16.0), // Adjust the horizontal padding
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 450.0, // Set a specific width for the dialog
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter your athlete\'s email to send the code',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    athleteEmail = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter athlete\'s email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add your action for sending invitation here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 9, 181, 152),
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text(
                    'Send Invitation',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 50, 48),
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _showAddAthleteDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 9, 181, 152),
                  ),
                  child: Text('Add athlete'),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Add your action for settings icon here
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Add your action for notification icon here
                  },
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10),
                Text(_coachName, style: TextStyle(color: Colors.white)),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Color.fromARGB(255, 50, 50, 48),
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.library_books, color: Colors.white),
                selectedIcon: Icon(
                  Icons.library_books,
                  size: 30,
                  color: Color.fromARGB(255, 9, 181, 152),
                ),
                label: Text(
                  'Exercise Library',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.layers, color: Colors.white),
                selectedIcon: Icon(
                  Icons.layers,
                  size: 30,
                  color: Color.fromARGB(255, 9, 181, 152),
                ),
                label: Text(
                  'Templates',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people, color: Colors.white),
                selectedIcon: Icon(
                  Icons.people,
                  size: 30,
                  color: Color.fromARGB(255, 9, 181, 152),
                ),
                label: Text(
                  'Athlete Overview',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list, color: Colors.white),
                selectedIcon: Icon(
                  Icons.list,
                  size: 30,
                  color: Color.fromARGB(255, 9, 181, 152),
                ),
                label: Text(
                  'Athlete List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chat, color: Colors.white),
                selectedIcon: Icon(
                  Icons.chat,
                  size: 30,
                  color: Color.fromARGB(255, 9, 181, 152),
                ),
                label: Text(
                  'Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;

class DisplayScreen extends StatefulWidget {
  @override
  DisplayScreenState createState() => DisplayScreenState();
  //this is where the route is linked
}

//This is created as a stateless widget so it can be changed

//This creates and agendaTemplate widget that is what creates the individual
//cards that will be displayed on screen
class DisplayScreenState extends State<DisplayScreen> {
  Widget agendaTemplate(Agenda agenda) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            agenda.getTitle(),
            //even though not title is assigned currently, when this method is
            //actually used, it will be passed in an agenda that already has
            //values assigned
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            agenda.itemString(),
            //again, these values will be passed in, this is just the toString
            //for all values except the title
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.blue,
            ),
          ),
          SizedBox(
              height: 30,
              child: FlatButton(
                //make sure to use a flatbutton or iconbutton when making
                //multiple buttons on the same screen because floatingactionbuttons
                //tend to freak out when there are multiple
                onPressed: () {
                  Navigator.pushNamed(context, '/editingScreen');
                },
                child: Text('Edit'),
              )),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Agenda List'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/homeScreen');
          },
        ),
      ),
      body: SingleChildScrollView(
        //this body type is used to allow the screen to become scrollable
        //when enough cards are created that it would normally overflow the screen
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: globals.agendaDisplay
                .map((agenda) => agendaTemplate(agenda))
                .toList()),
        //Uses the global agendaDisplay variable and iterates through it using the
        //.map function. Then the agenda variable type is specified as the type of item
        //to be looked at while iterating. Then it points to the agendaTemplate function
        //with whatever the current item being looked at as what will be passed in.
        //Finally the.toList is needed to add what is created by the agendaTemplate
        // to the widget list created by the children parameter.
      ),
    );
  }
}

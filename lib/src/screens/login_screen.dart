import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                emailField(),
                passwordField(),
                submitButton()
              ],
            ),
          ),
        )
    );
  }

  Widget emailField(){

    return TextFormField(

      decoration: InputDecoration(

        labelText: 'Email Address',
        hintText: 'eg: you@example.com'

      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value){
        //when validator is called it receives as the first argument the current value of the formfield
        if(!value.contains('@')||!value.contains('.com')){
          return 'Enter a valid email';
        }
        return null;
      },

      onSaved: (String value){

        email = value;

      },

    );

  }

  Widget passwordField(){

    return TextFormField(

      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password'
      ),
      obscureText: true,
      validator: (String value){

        if(value.length < 4){
          return 'Password must be 4 characters long...';
        }

        return null;

      },

      onSaved: (String value){

        password = value;

      },

    );

  }

  Widget submitButton(){

    return RaisedButton(

      onPressed: () {

        if(formKey.currentState.validate()) {
          formKey.currentState.save();
          formKey.currentState.reset();
          print('Time to consume $email and $password');
        }

      },
      child: Text('Submit'),
      color: Colors.amberAccent,

    );

  }

}
/**
 * A variable of type global key gives us a reference to the unique element or the unique widget that
 * has been created inside our widget structure.
 * So a globalKey variable is how we get reference to a particular element, that has been rendered to the screen of our device
 *
 * Form Widget is a stateful widget, as everytime an user types in something new in the widget it is going to re-render itself.
 * NOTE:
 *    When we create a stateful widget, we get a class that represents, the stuff on the screen of the device, which gets
 *    thrown away everytime the screen is rerendered, but we have another class associated with the StatefulWidget creation
 *    that is persisted to hold all the values that we have assigned to it and change over time
 *
 * A similar thing happens to our form that we have created, we have got the core Form widget, that is responsible for showing
 * information on the screen of our device. And this form gets created and thrown away everytime application is rerendered, but the
 * actual values that are stored within form are stored in the FormState object.
 *
 * So when we create a global key and pass it on to the form, the globalkey is actually goin to reference the formstate
 *
 */












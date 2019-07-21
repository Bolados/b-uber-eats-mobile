import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oubereats/domains/constants/routes.dart';
import 'package:oubereats/screens/splashScreen/splashScreen.dart';
import 'package:oubereats/theme/theme.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

void main() async {
    // Initializes the translation module
    await i18n.init();

    // then start the application
    runApp( MyApplication(),);
}

class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  void initState(){
      super.initState();

      // Initializes a callback should something need 
      // to be done when the language is changed
      i18n.onLocaleChangedCallback = _onLocaleChanged;
  }

  ///
  /// If there is anything special to do when the user changes the language
  ///
  _onLocaleChanged() async {
      // do anything you need to do if the language changes
      print('Language has been changed to: ${i18n.currentLanguage}');
  }

    ///
    /// Main initialization
    ///
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      // initialRoute: ROUTE.INDEX,
      home:  SplashScreen(),
      routes: ROUTES,
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
      ],
      // Tells the system which are the supported languages
      supportedLocales: i18n.supportedLocales(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Icon(Icons.add),
        //   ),
        // ]
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(i18n.currentLanguage),
              onPressed: () async {
                await i18n.setLanguage(i18n.currentLanguage == 'fr' ? 'en' : 'fr');
                setState((){});
              },
            ),
            Text(i18n.tr('SPLASH_SCREEN.FOOTER.SECOND')), 
            Text(i18n.plural('deep.clicked', _counter)),
            Text(i18n.tr('msg', args: ['aissat', 'Flutter'])),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ExScreen1');
              },
              child: Text('ExScreen1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ExScreen2');
              },
              child: Text('ExScreen2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context,  ROUTE.SPLASH_SCREEN);
              },
              child: Text('Splash screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}

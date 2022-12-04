import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_view_model.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(
          create: (context) => CountProvider(),
        ),
        // ChangeNotifierProvider<SecondCountProvider>(
        //   create: (context) => SecondCountProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: true);

    /// 親にSecondCountProviderが定義されていないためアクセス不可（ProviderNotFoundExceptionが発生）
    /// このサンプルアプリ程度ではProviderを挿入することを忘れることはないと思いますが、規模の大きいアプリになると
    /// 「気をつける」くらいしか防ぐ方法がない
    final secondCountProvider =
        Provider.of<SecondCountProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              countProvider.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              secondCountProvider.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countProvider.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

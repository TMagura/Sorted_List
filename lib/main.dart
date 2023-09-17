// ignore_for_file: prefer_const_constructors
/*
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/counter_mode.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // can also  use MultiProviders like so 
    //use also ChangeNotifierProvider
    //future provider must catch error and have initialData;
    //or jus say Provider but all have the create: and the Child: who will be listening with Provider widgets wont listen 
    //because it is meant to be a cache to hold data only
    return ChangeNotifierProvider<CounterModel>(
      //hre we create an instance that will provide the data to be listenned
      create: (context)  =>CounterModel(),
      child: DemoApp(),
      
      );
  }
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterInstance = Provider.of<CounterModel>(context);
    //#####################################
    //use the above or the one below its the same
    //####################################
    final counterInstance = context.watch<CounterModel>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed:()=> counterInstance.decrement(), 
                //so by using consumer<ClassName> we are just reloading the specific widget only
                //if we dont want to put a parameter we just use  underscore like below
                child: Text("-1", style: TextStyle(color: Colors.black),),
              ),
              Consumer<CounterModel>(builder:(_,counterInstance,__) => Text("${counterInstance.counter}")),
              ElevatedButton(
                onPressed:()=> counterInstance.increment(), 
                child: Text("+1", style: TextStyle(color: Colors.black),),
              ),
              Semantics.fromProperties(
                child: ElevatedButton(onPressed: (){}, child: Text("click me")),
                properties: SemanticsProperties(
                label: "tap me",
                hint: "tap to see ", 
                button: true, 
                enabled: true, 
                value: "play"
              ),)
            ],
          ),
        ),
      ),
    );
  }
}*/


//#####################################################################################################
//RiverPod example
//#####################################################################################################

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/sortedList/products.dart';
import 'package:state_management/sortedList/sorted.dart';


void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {

Widget build(BuildContext context, WidgetRef ref) {
  final products = ref.watch(productsProvider);
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        actions: [
          DropdownButton<ProductSortType>(
           
            style: TextStyle(
              color: Colors.white,
            ),
            dropdownColor: Colors.amber,
            value: ref.watch(productSortTypeProvider),
            onChanged: (value) {
              //state is jus like set state /update changes
              ref.watch(productSortTypeProvider.notifier).state = value!;
            },
            items: const [
              DropdownMenuItem(
                value: ProductSortType.name,
                child:Text("SortBy Name"),
                // Icon(Icons.sort_by_alpha),

              ),
              DropdownMenuItem(
                value: ProductSortType.price,
                child:Text("SortBy Price"),
                 //Icon(Icons.sort),
              ),
            ],
          ),
        ],
      ),
    body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} \$'),
          );
        },
      ),
    ),
  );
}
}
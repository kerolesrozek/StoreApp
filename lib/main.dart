import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubits/addproductcubit/addproduct_cubit.dart';
import 'package:storeapp/cubits/getallproductcubit/cubit/getallproduct_cubit.dart';
import 'package:storeapp/views/productview.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider(create: (context)=>GetallproductCubit()),
    BlocProvider(create: (context)=>AddproductCubit()),
      ],
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsView(),
      ),
    );
  }
}

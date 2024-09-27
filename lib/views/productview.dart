import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubits/getallproductcubit/cubit/getallproduct_cubit.dart';
import 'package:storeapp/widgets/addproductinbuttomsheet.dart';
import 'package:storeapp/widgets/productlistview.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({
    super.key,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    BlocProvider.of<GetallproductCubit>(context).getAllproduct();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'New Trend',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetallproductCubit, GetallproductState>(
        builder: (context, state) {
          if (state is Getallproductloadingstate) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Getallproductsuccessstate) {
            return ProductListView(
              products: state.products,
            );
          } else {
            return Text('there was an error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return AddProductInButtomSheet();
              });
        },
        child: Icon(Icons.add),
        elevation: 4,
      ),
    );
  }
}

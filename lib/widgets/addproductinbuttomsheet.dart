import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubits/addproductcubit/addproduct_cubit.dart';
import 'package:storeapp/widgets/custombutton.dart';
import 'package:storeapp/widgets/custtomtextfield.dart';
import 'package:storeapp/widgets/textform.dart';

class AddProductInButtomSheet extends StatelessWidget {
  const AddProductInButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<AddproductCubit, AddproductState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is AddproductSuccessState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing:state is AddproductLoadingState?true:false ,
            child: TextForm());
        },
      ),
    );
  }
}

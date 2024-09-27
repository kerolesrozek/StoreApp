import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubits/addproductcubit/addproduct_cubit.dart';
import 'package:storeapp/cubits/getallproductcubit/cubit/getallproduct_cubit.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/widgets/custombutton.dart';
import 'package:storeapp/widgets/custtomtextfield.dart';

class TextForm extends StatefulWidget {
  const TextForm({
    super.key,
  });

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String? productname;
  String? description;
  String? price;

  GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CusttomTextField(
              onSaved: (p0) {
                productname = p0;
              },
              hintText: 'product name',
            ),
            CusttomTextField(
              onSaved: (p0) {
                description = p0;
              },
              hintText: 'description',
            ),
            CusttomTextField(
              onSaved: (p0) {
                price = p0;
              },
              hintText: 'price',
            ),
            BlocBuilder<AddproductCubit, AddproductState>(
              builder: (context, state) {
                return CustomButton(
                  isloading: state is AddproductLoadingState ? true : false,
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      BlocProvider.of<AddproductCubit>(context).addproduct(
                        product: Productmodel(
                          id: 21,
                          title: productname!,
                          price: 10,
                          description: description!,
                          category: 'category',
                          image:
                              'https://tse1.mm.bing.net/th?id=OIP.U_VJuupQohwnzXcKMztqWgHaEo&pid=Api',
                          rate: RatingModel(rate: 10, count: 10),
                        ),
                        
                      );
                      BlocProvider.of<GetallproductCubit>(context).getAllproduct();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}

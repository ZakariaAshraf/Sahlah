import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sahlah/features/widgets/custom_toast_widget.dart';
import 'package:sahlah/features/widgets/primary_button.dart';

import '../../../../constants/app_colors.dart';
import '../../../../data/models/price_entry_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../cubits/price_update_cubit.dart';

class AddPriceScreen extends StatefulWidget {
  final String categoryId;
  final String subcategoryId;
  final String productId;
  final String? superMarketName;
  final String? oldPrice;

  const AddPriceScreen({
    super.key,
    required this.categoryId,
    required this.subcategoryId,
    required this.productId,  this.superMarketName, this.oldPrice,
  });

  @override
  State<AddPriceScreen> createState() => _AddPriceScreenState();
}

class _AddPriceScreenState extends State<AddPriceScreen> {
  File? _image;
  TextEditingController priceController = TextEditingController();

  TextEditingController priorityController = TextEditingController();

  String? supermarket;

  List<String> selectedSupermarket = ["Seoudi", "Carrefour", "HyperOne"];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    priceController.text=widget.oldPrice ?? "";
    return BlocListener<PriceUpdateCubit, PriceUpdateState>(
      listener: (context, state) {
        if (state is PriceUpdateSuccess) {
          CustomToastWidget.show(context: context, title: "Update success", iconPath: "assets/images/start.jpg");
          Navigator.pop(context);
        } else if (state is PriceUpdateFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
  child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Update Price",
        //   style: GoogleFonts.inter(
        //     color: AppColors.blackSecondary,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: widget.superMarketName ?? supermarket,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: AppLocalizations.of(context)!.supermarket,
                      prefixIcon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                    items: selectedSupermarket.map((task) {
                      return DropdownMenuItem(
                        value: task,
                        child: Text(
                          task,
                          style: GoogleFonts.aBeeZee(
                            color: AppColors.blackSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      supermarket = value as String;
                    },
                    validator: (value) {
                      if (value == null) {
                        return l10n!.selectSupermarket;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: l10n!.enterPrice,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => selectImage(),
                    child: _image != null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.file(_image!, fit: BoxFit.cover),
                          )
                        : Container(
                            width: 331,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  l10n.uploadReceipt,
                                  style: GoogleFonts.inter(
                                    color: AppColors.blackSecondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<PriceUpdateCubit, PriceUpdateState>(
            builder: (context, state) {
              return PrimaryButton(
                title: l10n.save,
                color: AppColors.primary,
                onTap: () => _addNewPriceWithOutReceipt(context),
              );
            },
          ),
        ],
      ),
    ),
);
  }
  void _addNewPriceWithOutReceipt(BuildContext context) {
    if (supermarket == null || supermarket!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.selectSupermarket)),
      );
      return;
    }

    if (priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.enterPriceValidation)),
      );
      return;
    }

    final priceEntry = PriceEntry(
      supermarket: supermarket!,
      price: double.parse(priceController.text),
      updatedAt: DateTime.now().toString(),
      id: "will be random",
      updatedBy: "zakaria"
    );

    context.read<PriceUpdateCubit>().updatePrice(
      widget.categoryId,
      widget.subcategoryId,
      widget.productId,
      priceEntry,
      supermarket!
    );
  }
  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sahlah/features/widgets/primary_button.dart';

import '../../../../constants/app_colors.dart';

class AddPriceScreen extends StatefulWidget {
  final String categoryId;
  final String subcategoryId;
  final String productId;

  const AddPriceScreen({
    super.key,
    required this.categoryId,
    required this.subcategoryId,
    required this.productId,
  });

  @override
  State<AddPriceScreen> createState() => _AddPriceScreenState();
}

class _AddPriceScreenState extends State<AddPriceScreen> {
  File? _image;
  TextEditingController priceController = TextEditingController();

  TextEditingController priorityController = TextEditingController();

  String? priority;

  List<String> selectedPriority = ["Seodi", "Carfour", "Hyperone"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add new Price",
          style: GoogleFonts.inter(
            color: AppColors.blackSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: priority,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: 'Super Market',
                      prefixIcon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                    items: selectedPriority.map((task) {
                      return DropdownMenuItem(value: task, child: Text(task,style: GoogleFonts.aBeeZee(
                        color: AppColors.blackSecondary,
                        fontWeight: FontWeight.w600,
                      ),));
                    }).toList(),
                    onChanged: (value) {
                      priority = value as String;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select supermarket';
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
                      hintText: 'Enter price here',
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
                                const Icon(Icons.camera_alt, color: AppColors.primary),
                                Text(
                                  "Upload receipt",
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
          PrimaryButton(title: "Save",color: AppColors.primary,)
        ],
      ),
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

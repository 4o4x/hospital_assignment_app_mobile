import 'package:flutter/material.dart';
import 'package:hospital_assignment_app_mobile/features/auth/screens/register.dart';
import 'package:hospital_assignment_app_mobile/main.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = '/location-screen';
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController serviceNameController = TextEditingController();
  late AnimationController _controller;

  String? selectedHospital;
  String? selectedService;

  List<String> hospitals = [
    'Hospital 1',
    'Hospital 2',
    'Hospital 3'
  ]; // Example hospital names
  List<String> services = [
    'Service 1',
    'Service 2',
    'Service 3'
  ]; // Example service names

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    hospitalNameController.dispose();
    serviceNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Location Change', style: TextStyle(color: Colors.white)),
        backgroundColor: mainButtonColor,
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
                color: mainContainerColor),
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(25),
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Location Change",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: mainTextColor, thickness: 2),
                SizedBox(height: 20),

                // DropdownButtonFormField for Hospital Name
                DropdownButtonFormField<String>(
                  dropdownColor: mainTextBoxColor,
                  value: selectedHospital,
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    fillColor: mainTextBoxColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0),
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "Hospital Name",
                    hintStyle: TextStyle(
                      color: mainTextColor,
                      fontSize: 20,
                    ),
                  ),
                  items:
                      hospitals.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHospital = newValue!;
                    });
                  },
                ),
                SizedBox(height: 10),

                // DropdownButtonFormField for Service Name
                DropdownButtonFormField<String>(
                  dropdownColor: mainTextBoxColor,
                  value: selectedService,
                  autofocus: false,
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    fillColor: mainTextBoxColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Service Name",
                    hintStyle: TextStyle(
                      color: mainTextColor,
                      fontSize: 20,
                    ),
                  ),
                  items: services.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedService = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Elevated Button for Register Page
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      primary: mainButtonColor,
                      shadowColor: Colors.transparent,
                      minimumSize: Size(300, 50)),
                  child: Text(
                    "Change Location",
                    style: TextStyle(
                      color: mainTextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IdentitySet extends StatefulWidget {
  const IdentitySet({super.key});

  @override
  State<IdentitySet> createState() => _IdentitySetState();
}

class _IdentitySetState extends State<IdentitySet>
    with SingleTickerProviderStateMixin {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  late AnimationController _sheetController;

  @override
  void initState() {
    super.initState();
    _sheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Customize entry duration
      reverseDuration: const Duration(
        milliseconds: 200,
      ), // Customize exit duration
    );
  }

  @override
  void dispose() {
    _sheetController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    countryController.dispose();
    super.dispose();
  }

  void _openPicker(
    contextBuildContext,
    List<String> items,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      useSafeArea: true,
      transitionAnimationController: _sheetController,
      context: contextBuildContext,
      builder: (_) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              controller.text = items[index];
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

     double screenWidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    
    List<String> days = List.generate(31, (i) => (i + 1).toString());
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    List<String> years = List.generate(60, (i) => (i + 1960).toString());
    return Column(
      children: [Row(children: [SizedBox(width: 15),Text('Your birthday',style:GoogleFonts.outfit(fontSize:20,fontWeight: FontWeight.w500 ))],),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: dayController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Day",
                  border: OutlineInputBorder(),
                ),
                onTap: () => _openPicker(context, days, dayController),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: monthController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Month",
                  border: OutlineInputBorder(),
                ),
                onTap: () => _openPicker(context, months, monthController),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: yearController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Year",
                  border: OutlineInputBorder(),
                ),
                onTap: () => _openPicker(context, years, yearController),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 30),
        Row(children: [SizedBox(width: 15),Text('Your location',style:GoogleFonts.outfit(fontSize:20,fontWeight: FontWeight.w500 ))],),
        SizedBox(height: 15,),
        SizedBox(width: screenWidth*0.9,
          child: TextField(
            controller: countryController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "location",
              suffixIcon: Icon(Icons.arrow_drop_down),
              border: OutlineInputBorder(),
            ),
          
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: false, // just show country names + flags
                countryListTheme: CountryListThemeData(
                  flagSize: 25,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onSelect: (Country country) {
                  setState(() {
                    countryController.text =
                        "${country.flagEmoji} ${country.name}";
                  });
                },
              );
            },
          ),
        ),


      ],
    );
  }
}

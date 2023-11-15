import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String selectedGender = "";
  String selectedCountry = "";
  List topicsSelectedList = [];
  List countriesList = ["India", "USA", "UAE", "Japan"];
  List countriesData = [
    {
      "name": "Ascension Island",
      "code": "AC",
      "emoji": "🇦🇨",
      "unicode": "U+1F1E6 U+1F1E8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
    },
    {
      "name": "Indonesia",
      "code": "ID",
      "emoji": "🇮🇩",
      "unicode": "U+1F1EE U+1F1E9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
    },
  ];

  @override
  void initState() {
    // selectedCountry = countriesList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [genderLayout(), topicsLayout(), countrySelection()],
        ),
      ),
    );
  }

  Widget countrySelection() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Country"),
        // Container(
        //   height: 50,
        //   width: 200,
        //   child: DropdownButton(
        //       value: selectedCountry.isEmpty ? null : selectedCountry,
        //       hint: Text("Select Country"),
        //       items: countriesList
        //           .map((e) => DropdownMenuItem(
        //               value: e,
        //               child: Row(
        //                 children: [
        //                   Icon(Icons.flag_circle),
        //                   Text(e),
        //                 ],
        //               )))
        //           .toList(),
        //       onChanged: (value) {
        //         print("onChanged $value");
        //         selectedCountry = value as String;
        //         setState(() {});
        //       }),
        // )
        Container(
          height: 50,
          width: 200,
          child: DropdownButton(
              value: selectedCountry.isEmpty ? null : selectedCountry,
              hint: Text("Select Country"),
              items: countriesData.map((e) {
                print(e.toString());
                return DropdownMenuItem(
                    value: (e as Map)['name'],
                    child: Row(
                      children: [
                        Image.network(
                          (e as Map)['image'],
                          width: 20,
                          height: 20,
                        ),
                        // Icon(Icons.flag_circle),
                        Text((e as Map)['name']),
                      ],
                    ));
              }).toList(),
              onChanged: (value) {
                print("onChanged $value");
                selectedCountry = value as String;
                setState(() {});
              }),
        )
      ],
    );
  }

  Column topicsLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Topics Preferance"),
        // Row(
        //   children: [
        //     Row(
        //       children: [
        //         Checkbox(value: true, onChanged: (status) {}),
        //         Text("Cricket")
        //       ],
        //     ),
        //   ],
        // ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          value: topicsSelectedList.contains("Cricket"),
          onChanged: (status) {
            if (status!) {
              topicsSelectedList.add("Cricket");
            } else {
              topicsSelectedList.remove("Cricket");
            }
            setState(() {});
          },
          title: Text("Cricket"),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          value: topicsSelectedList.contains("Tech"),
          onChanged: (status) {
            if (status!) {
              topicsSelectedList.add("Tech");
            } else {
              topicsSelectedList.remove("Tech");
            }
            setState(() {});
          },
          title: Text("Tech"),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          value: topicsSelectedList.contains("Fashion"),
          onChanged: (status) {
            if (status!) {
              topicsSelectedList.add("Fashion");
            } else {
              topicsSelectedList.remove("Fashion");
            }
            setState(() {});
          },
          title: Text("Fashion"),
        ),
        Text(topicsSelectedList.toSet().toList().toString())
      ],
    );
  }

  Column genderLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gender Preferance"),
        Row(
          children: [
            Row(
              children: [
                Radio(
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      selectedGender = value!;
                      print(selectedGender);
                      setState(() {});
                    }),
                Text("Male")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: "Female",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      selectedGender = value!;
                      setState(() {});
                    }),
                Text("Female")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: "Others",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      selectedGender = value!;
                      setState(() {});
                    }),
                Text("Others")
              ],
            ),
          ],
        ),
        // RadioListTile(
        //   value: "Male",
        //   groupValue: selectedGender,
        //   onChanged: (value) {},
        //   title: Text("Male"),
        //   subtitle: Text("For all categories"),
        // )
      ],
    );
  }
}

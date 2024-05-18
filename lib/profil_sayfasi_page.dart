import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:deneme_2/sonuc_sayfasi_page.dart';
import 'package:flutter/material.dart';

class ProfilSayfasiPage extends StatefulWidget {
  const ProfilSayfasiPage({super.key});

  @override
  ProfilSayfasiPagestate createState() => ProfilSayfasiPagestate();
}

class ProfilSayfasiPagestate extends State<ProfilSayfasiPage> {
    final _formKey = GlobalKey<FormState>();
   final List<String> _profiles = ['Profil 1', 'Profil 2', 'Profil 3'];
  //  final List<String> _eyeOptions = ['Miyop', 'Hipermetrop','Astigmat','Şaşılık'];
  //  final List<String> _diseaseOptions = ['Yok', 'Var'];
  //  final List<String> _physicalOptions = ['Bel Fıtığı','Boyun Fıtığı','Karpal Tünel Sendromu'];
  //  final List<String> _psychologicalOptions =['Depresyon','Panik Atak','Anksiyete','Dehp','Otizm'];
  final MultiSelectController _controller = MultiSelectController();
  String? _selectedProfile;
  String? _selectedAge;
  String? _selectedHeight;
  String? _selectedWeight;
  String? _selectedDisease;
  String? _selectedEyeDisease;
  String? _selectedPhysicalDisease;
  String? _selectedPsychologicalDisease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    const Text(
                    'Ekran Süresi Hesaplama',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedProfile,
                    hint: const Text('Profil Seçimi'),
                    items: _profiles.map((profile) {
                      return DropdownMenuItem(
                        value: profile,
                        child: Text(profile),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedProfile = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedAge,
                    hint: const Text('Yaşınız'),
                    items: List.generate(100, (index) {
                      return DropdownMenuItem(
                        value: index.toString(),
                        child: Text(index.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedAge = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Boyunuz',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _selectedHeight = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen boyunuzu giriniz';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Kilonuz',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _selectedWeight = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen kilonuzu giriniz';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedDisease,
                    hint: const Text('Herhangi bir hastalığınız var mı'),
                    items: _diseaseOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDisease = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MultiSelectDropDown(
                  controller: _controller,
              onOptionSelected: (options) {
                debugPrint(options.toString());
              },
              options:  const <ValueItem>[
                ValueItem(label: 'Miyop', value: '1'),
                ValueItem(label: 'Hipermetrop', value: '2'),
                ValueItem(label: 'Astigmat', value: '3'),
                ValueItem(label: 'Şaşılık', value: '4'),
              ],
              maxItems: 2,
              disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
              selectionType: SelectionType.multi,
              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedPhysicalDisease,
                    hint: const Text('Fiziksel Hastaliklar'),
                    items:  _physicalOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPhysicalDisease = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedPsychologicalDisease,
                    hint: const Text('Psikoloji Hastaliklari'),
                    items: _psychologicalOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPsychologicalDisease = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Kaydet-Güncelle işlemleri burada gerçekleştirilecek
                        print('Profil Seçimi: $_selectedProfile');
                        print('Yaşiniz: $_selectedAge');
                        print('Boyunuz: $_selectedHeight');
                        print('Kilonuz: $_selectedWeight');
                        print('Herhangi bir hastaliğiniz var mi: $_selectedDisease');
                        print('Göz Hastaliklari: $_selectedEyeDisease');
                        print('Fiziksel Hastaliklar: $_selectedPhysicalDisease');
                        print('Psikoloji Hastaliklari: $_selectedPsychologicalDisease');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Kaydet-Güncelle'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                      context, 
                       MaterialPageRoute(builder: (context)=>SonucSayfasiPage()
                       ),
                       );// Uygulamayı Başlat işlemi burada gerçekleştirilecek
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Uygulamayı Başlat'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

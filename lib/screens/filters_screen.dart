import 'package:flutter/material.dart';
import 'package:travelapp/widgets/drawerr.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({super.key});

  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _summer ;
  var _winter ;
  var _family ;

  @override
    void initState() {
    _summer = widget.currentFilter['summer'];
    _winter = widget.currentFilter['winter'];
    _family = widget.currentFilter['family'];
    super.initState();
  }

  Widget buildSwitchListTile (String title, String subtitle, var currentValue,  Function(bool) updateValue ){
    return SwitchListTile(
                  title: Text(title),
                  subtitle: Text(subtitle),
                  value: currentValue, 
                  onChanged: updateValue,
                  );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: (){
              final selectedFilters ={
                'summer': _summer,
                'winte': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
            ),
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'الرحلات الصيفيه فقط',
                  'إظهار الرحلات في فصل الصيف فقط',
                  _summer,
                  (newValue){
                    setState(() {
                      _summer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية فقط',
                  'إظهار الرحلات في فصل الشتاء فقط',
                  _winter,
                  (newValue){
                    setState(() {
                      _winter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'للعلائلات',
                  'إظهار الرحلات التي للعائلات فقط',
                  _family,
                  (newValue){
                    setState(() {
                      _family = newValue;
                    });
                  },
                ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}
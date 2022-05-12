import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsModel{

  IconData icon;
  String optionsName;

  OptionsModel(this.icon, this.optionsName);

}


   List<OptionsModel> optionsData = [
   OptionsModel( Icons.person, 'Name'),
   OptionsModel( Icons.work, 'Designation'),
   OptionsModel( Icons.phone, 'Phone'),
   OptionsModel( Icons.email, 'Email'),
   OptionsModel( Icons.vpn_lock, 'Website'),
   OptionsModel( Icons.home_work, 'Company Name'),
   OptionsModel( Icons.location_on, 'Address'),
 ];
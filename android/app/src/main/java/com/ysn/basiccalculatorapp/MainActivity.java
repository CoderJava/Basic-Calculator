/*
 * Created by Yudi Setiawan on 12/25/18 2:02 PM
 * Copyright (c) 2018. All right reserved.
 * Last modified 12/25/18 2:02 PM
 */

package com.ysn.basiccalculatorapp;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }
}

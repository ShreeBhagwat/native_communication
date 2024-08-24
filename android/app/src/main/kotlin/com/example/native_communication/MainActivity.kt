package com.example.native_communication

import android.app.Activity
import android.app.Dialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    private val channel = "DIALOG";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            if(call.method == "showDialog"){
                val dialog = Dialog(activity);
                dialog.setTitle("Hello From Android")
                dialog.show()
            }
        }

    }


}


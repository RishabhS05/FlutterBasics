package com.example.wigets_app_demo

import android.view.Gravity
import android.view.ViewGroup
import android.webkit.WebSettings
import android.webkit.WebView
import android.widget.FrameLayout
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine : FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "web_view").setMethodCallHandler { call, result ->
            if(call.method == "openWebView") {
                loadWebView()
            }
        }
    }

    fun loadWebView() {
        val layout = FrameLayout(this)
        val layoutparams = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER_HORIZONTAL or Gravity.CENTER_VERTICAL)
        layout.layoutParams = layoutparams
        val webview = WebView(this)
        webview.setLayoutParams(FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
        val webSettings : WebSettings = webview.getSettings()
        webSettings.javaScriptEnabled = true
        webSettings.useWideViewPort = true
        webSettings.loadWithOverviewMode = true
        webview.loadUrl("https://www.google.com/");
//        webview.setWebViewClient(object : WebViewClient() {
//            override fun onPageStarted(view : WebView, url : String, favicon : Bitmap) {
//                super.onPageStarted(view, url, favicon)
//                val progress = 0.0
////                DebugLog.e("shouldOverrideLoading:  $url")
////                showProgress(true)
//                try {
////                    if(url.contains(com.simplysmart.app.activity.EasyPayPaymentWebViewActivity.responseUrl) && !responseReceived) {
//////                        handlePaymentResponse(url)
////                    }
////                    if(url.contains(com.simplysmart.app.activity.EasyPayPaymentWebViewActivity.responseUrl)) {
////                        view.stopLoading()
////                    }
//                } catch(e : UnsupportedEncodingException) {
//                    e.printStackTrace()
//                }
//            }
//
//            override fun shouldOverrideUrlLoading(view : WebView, url : String) : Boolean {
////                showProgress(true)
////                DebugLog.e("shouldOverrideLoading:  $url")
//                return false
//            }
//
//            override fun onReceivedError(view : WebView, errorCode : Int, description : String, failingUrl : String) {
////                Toast.makeText(getActivity(), description, Toast.LENGTH_SHORT).show();
//            }
//
//            override fun onPageFinished(view : WebView, url : String) {
//                super.onPageFinished(view, url)
////                showProgress(false)
//            }
//        })webview.setWebViewClient(object : WebViewClient() {
//            override fun onPageStarted(view : WebView, url : String, favicon : Bitmap) {
//                super.onPageStarted(view, url, favicon)
//                val progress = 0.0
////                DebugLog.e("shouldOverrideLoading:  $url")
////                showProgress(true)
//                try {
////                    if(url.contains(com.simplysmart.app.activity.EasyPayPaymentWebViewActivity.responseUrl) && !responseReceived) {
//////                        handlePaymentResponse(url)
////                    }
////                    if(url.contains(com.simplysmart.app.activity.EasyPayPaymentWebViewActivity.responseUrl)) {
////                        view.stopLoading()
////                    }
//                } catch(e : UnsupportedEncodingException) {
//                    e.printStackTrace()
//                }
//            }
//
//            override fun shouldOverrideUrlLoading(view : WebView, url : String) : Boolean {
////                showProgress(true)
////                DebugLog.e("shouldOverrideLoading:  $url")
//                return false
//            }
//
//            override fun onReceivedError(view : WebView, errorCode : Int, description : String, failingUrl : String) {
////                Toast.makeText(getActivity(), description, Toast.LENGTH_SHORT).show();
//            }
//
//            override fun onPageFinished(view : WebView, url : String) {
//                super.onPageFinished(view, url)
////                showProgress(false)
//            }
//        })
//       splashview = ImageView(this)
//       splashview.setLayoutParams(FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
//       splashview.setScaleType(ScaleType.FIT_XY)
//       splashview.setImageResource(R.drawable.splash)
//       splashview.setVisibility(View.INVISIBLE)
//       progressbar = ProgressBar(this)
//        val params = FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER_HORIZONTAL or Gravity.CENTER_VERTICAL)
//       progressbar.setLayoutParams(params)
//       progressbar.setVisibility(View.INVISIBLE)
        layout.addView(webview)
        layout.setForegroundGravity(Gravity.CENTER)
//       layout.addView(progressbar)
        setContentView(layout)
    }
}

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPaymentGatewayScreen extends StatefulWidget {
  const RazorpayPaymentGatewayScreen({super.key});

  @override
  State<RazorpayPaymentGatewayScreen> createState() =>
      _RazorpayPaymentGatewayScreenState();
}

class _RazorpayPaymentGatewayScreenState
    extends State<RazorpayPaymentGatewayScreen> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                startPayment();
              },
              child: Text("Start payment"))
        ],
      ),
    );
  }

  startPayment() {
    var options = {
      'key': 'rzp_test_qmQgufIIPuskJ3',
      'amount': 1 * 100,
      'name': 'Acme Corp.',
      'description': 'App subscription',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showMessage("PaymentSuccess");
    // update data to backend server
    // navigate to success screen
  }

  showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showMessage("PaymentError");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    showMessage("ExternalWallet");
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}

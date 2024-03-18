import 'package:dio/dio.dart';
import 'package:shopping/app/networks/dio_client.dart';
import 'package:shopping/app/networks/endpoints.dart';
import 'package:shopping/app/networks/network_model/req/customer_register_req.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_name.dart';
import 'package:shopping/app/networks/network_model/res/customer_login_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_register_res.dart';

class AuthRepo {
  final DioClient dioClient = DioClient(Dio());
  Future<CustomerRegisterRes?> AuthSignup(
      CustomerRegisterReq customerRegisterReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.register,
        data: customerRegisterReq.toJson(),
      );
      if (response.statusCode == 200) {
        final signupResponse = CustomerRegisterRes.fromJson(response.data);
        if (signupResponse.token != null) {
          return signupResponse;
        } else {
          final signupResponse =
              CustomerRegisterRes(error: "User Not Register! Something wrong");
          return signupResponse;
        }
      } else {
        final signupResponse = CustomerRegisterRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signupResponse;
        } else {
          return CustomerRegisterRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerRegisterRes(error: "Unexpected Error");
    }
  }

  Future<CustomerLoginRes?> AuthSignin(
      CustomerRegisterReq customerRegisterReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.login,
        data: customerRegisterReq.toJson(),
      );
      if (response.statusCode == 200) {
        final signinResponse = CustomerLoginRes.fromJson(response.data);
        if (signinResponse.token != null) {
          return signinResponse;
        } else {
          final signinResponse =
              CustomerLoginRes(error: "User Not Register! Something wrong");
          return signinResponse;
        }
      } else {
        final signinResponse = CustomerLoginRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinResponse;
        } else {
          return CustomerLoginRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerLoginRes(error: "Unexpected Error");
    }
  }

  Future<CustomerGetNameRes?> getUserDetails() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.getCustomerDetails,
      );
      if (response.statusCode == 200) {
        final userResponse = CustomerGetNameRes.fromJson(response.data);
        return userResponse;
      } else {
        return CustomerGetNameRes.fromJson(response.data);
      }
    } catch (e) {
      return CustomerGetNameRes(error: "Unexpected Error");
    }
  }
}

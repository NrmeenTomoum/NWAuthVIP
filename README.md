# NWAuthVIP
example for Generic call 
Using generic Encodeable datatype and authentication and Alamofire Mock 
RequestService.sendHttpRequest(httpMethod: .post,
url: "http://52.25.21.235:8080/login",
objectType: LoginResponse.self, isRelativeUrl: false, params: nil, isAuth: false,
customHeaders: ["Authorization": "Basic bW9iaWxlOnBpbg==",
"Content-Type": "application/x-www-form-urlencoded"],
body: ["grantType": "password", "username": request.number, "password": request.otp])
{ result, error  in

}

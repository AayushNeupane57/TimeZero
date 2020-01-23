import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Auth
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googlesignin = new GoogleSignIn();
  final FacebookLogin _facebooklogin = new FacebookLogin();


  //Simple sign up with any email and password
  Future<AuthResult> signUp(String email, String password) async
  {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email , password: password);
    result!=null ? print("Successfully signed up") : print("Sign up failed");
    return result;
  }

  Future<AuthResult> signIn(String email, String password) async
  {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email , password: password);
    result!=null ? print("Successfully signed up") : print("Sign up failed");
    return result;
  }

  //App sign in using google account
  Future<AuthResult> googlelogin() async
  {
    GoogleSignInAccount googleacc = await _googlesignin.signIn();
    GoogleSignInAuthentication googleauth = await googleacc.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential
    (
      idToken: googleauth.idToken,
      accessToken: googleauth.accessToken,
    );
    final AuthResult result = await _auth.signInWithCredential(credential);
    return result;
  }

  Future<AuthResult> facebooklogin() async
  {
    FacebookLoginResult  result =  await _facebooklogin.logIn(['email','public_profile']);
    switch (result.status)
    {
      case FacebookLoginStatus.loggedIn:
        AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
        AuthResult authresult = await _auth.signInWithCredential(credential);
        print("Successfully logged in");
        return authresult;
      case FacebookLoginStatus.cancelledByUser:
        await _facebooklogin.logOut();
        print("Login In cancelled by user");
        AuthResult authresult;
        return authresult;
      case FacebookLoginStatus.error:
        print("${result.errorMessage} ");
        AuthResult authresult;
        return authresult;
    }
  }

  Future<FirebaseUser> currentuser() async
  {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  //Account log out
  void signOut() async
  {
    print("User signed out");
    _googlesignin.signOut();
    _facebooklogin.logOut();
    _auth.signOut();

  }

}

firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    // User is signed in.
    console.log("paso aqui");

    //document.getElementById("user_div").style.display = "block";/**/
    //document.getElementById("login_div").style.display = "none";

    window.location = "file:///Users/ivosam2/Downloads/firebaseWebLogin/otra.html";

    var user = firebase.auth().currentUser;



    if(user != null){

      var email_id = user.email;
      document.getElementById("user_para").innerHTML = "Welcome User : " + email_id;

    }

  } else {
    // No user is signed in.

    console.log()

    document.getElementById("user_div").style.display = "none";
    document.getElementById("login_div").style.display = "block";/*block*/

  }
});

function login(){
  console.log("lol");
  var userEmail = document.getElementById("email_field").value;
  var userPass = document.getElementById("password_field").value;

  firebase.auth().signInWithEmailAndPassword(userEmail, userPass).catch(function(error) {
    console.log("lol");
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;

    window.alert("Error : " + errorMessage);

    // ...
  });

}

function logout(){
  firebase.auth().signOut();
  window.location = "file:///Users/ivosam2/Downloads/firebaseWebLogin/index.html"
}

var tblUsers = document.getElementById('tbl_users_list');
var databaseRef = firebase.database().ref('users/');

      
function save_user() {
  var uid = firebase.database().ref().child('users').push().key;

  var name = document.getElementById('user_name').value;
  //var id = document.getElementById('user_id').value;

  var cubiculo = document.getElementById('user_cubiculo').value;

  var horario = document.getElementById('user_horario').value;

  var email = document.getElementById('user_email').value;

  var telefono = document.getElementById('user_telefono').value;

  var webpage = document.getElementById('user_webpage').value;

  var materias = document.getElementById('user_materias').value;

  var tts = document.getElementById('user_tts').value;

  var data = {
    user_id: uid,
    user_name: name,
    user_cubiculo: cubiculo,
    user_horario: horario,
    user_email: email,
    user_telefono: telefono,
    user_webpage: webpage,
    user_materias: materias,
    user_tts: tts
  }

  var updates = {};
  updates['users/' + uid] = data;
  firebase.database().ref().update(updates);

  alert('La información del usuario se agregó correctamente');
  reload_page();
}

function update_user() {

  var name = document.getElementById('user_name').value;
  var id = document.getElementById('user_id').value;

  var data = {
    user_id: id,
    user_name : name
  } 

  var updates = {};
  updates['users/' + id] = data;
  firebase.database().ref().update(updates);

  alert('The user was updates successfully');

  reload_page();
}

function delete_user() {
  var id = document.getElementById('user_id').value;
  firebase.database().ref().child('/users/' + id).remove();
  alert('The user was deleted successfully');
  reload_page();
  
}

function reload_page() {
  window.location.reload();
}

function ValidateEmail(inputText) {
  var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
  if(inputText.value.match(mailformat)) {
    return true;
  } else {
    alert("You have entered an invalid email address!");
    inputText.focus();
    return false;
  }
}

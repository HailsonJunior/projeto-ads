document.querySelector("#password").classList.add("input-password");
document.getElementById("toggle-password").classList.remove("d-none");

const passwordInput = document.querySelector("[type='password']");
const togglePasswordButton = document.getElementById("toggle-password");

togglePasswordButton.addEventListener("click", function(){
    if (passwordInput.type === "password") {
            passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
});

$('#btnLogin').click(function(){
    $('#changePassword').modal('show');
})

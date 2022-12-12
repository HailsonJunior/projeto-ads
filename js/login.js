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

/* $('#formLogin').on('submit', function(event){
    event.preventDefault();
    $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: "dataType",
        success: function (response) {
            console.log(response);
            //location.replace(location.href + 'home.jsp');
        }
    });
    //$('#changePassword').modal('show');
}); */

function test() {
    const email = document.getElementById("email").value;
    pnt = email.indexOf(".");
    at = email.indexOf("@");
    ch1 = email.substr(0, at);
    ch2 = email.substr(at + 1, pnt - (at + 1));
    ch3 = email.substr(pnt);
    if (email == "" ||email.length>50) {
        alert("Entre Votre Email SVP");
        return false;
    }
    if (pnt == -1 || at == -1) {
        alert("Il n'y a pas de point / @");
        return false;
    }
    if (pnt < at) {
        alert("Vérifier Les Positions des Point et @ SVP");
        return false;
    }
    if (
        ch1 == "" ||
        ch2 == "" ||
        ch3 == "" ||
        !alphanum(ch1) ||
        !alphanum(ch2) ||
        !alpha(ch3)
    ) {
        alert("Vérifier Votre Email SVP");
        return false;
    }
    if (ch3.length < 2 || ch3.length > 4 && !alpha(ch3)) {
        alert("'.' doit contenir entre 2 et 4 caractères alphabétiques");
        return false;
    }
    const password = document.getElementById("password").value;
    if (password.length !=6){
        alert ("Le mot de passe doit contenir exactement 6 caractères")
    }                    
    var min=0;
    var max=0;
    var chiffre=0;
    for (let i=0;i<password.length;i++){
        if (password.charAt(i)>="A"||password.charAt(i)<="Z"){
            min++;
        } 
        if(password.charAt(i)<"a"||password.charAt(i)>"z"){
            max++;
        }
        if (password.charAt(i)<"0"||password.charAt(i)>"9"){
            chiffre++;
        }
        if ( min == 0 ||max == 0||chiffre == 0) {
            alert("t comportant au moins une lettre majuscule, une lettre minuscule et un chiffre");
            return false;
        }
    }
    const genre=document.getElementById("genre").selectedIndex;
    if (genre == 0) {
        alert("Vérifier Votre choix");
        return false;
    }
    const o1=document.getElementById("o1").checked;
    const n1=document.getElementById("n1").checked;
    const s1=document.getElementById("s1").checked;
    const o2=document.getElementById("o2").checked;
    const n2=document.getElementById("n2").checked;
    const s2=document.getElementById("s2").checked;
    const o3=document.getElementById("o3").checked;
    const n3=document.getElementById("n3").checked;
    const s3=document.getElementById("s3").checked;
    if (!o1&&!n1 &&!s1){
        alert("Vérifier le Question1");
        return false;
    }
    if (!o2&&!n2 &&!s2){
        alert("Vérifier le Question2"); 
        return false ;
    }
    if (!o3&&!n3 &&!s3){
        alert("Vérifier le Question3");
        return false;
    }
    alert("Bravo");
    return true;
}

function alphanum(ch) {
    ch1=ch.toUpperCase();
    for (let i = 0; i < ch1.length; i++) {
        if (ch1[i] <= "A" && ch1[i] >= "Z" || ch1[i] <= "0" && ch1[i] >= "9") {
            return false;
        }
    }
    return ch1.length>2;
}
function alpha(ch) {
    ch1=ch.toUpperCase();
    for (let i = 0; i < ch1.length; i++) {
        if (ch1[i] <= "A" && ch1[i] >= "Z" ) {
            return false;
        }
    }
    return ch1.length>=2 && ch1.length<=4;
}

function editer(){
    const sandage=document.getElementById("sandage").selectedIndex;
    if (sandage==0){
        alert("Vérifier Votre choix");
        return false;
    }
}
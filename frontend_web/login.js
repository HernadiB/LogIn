window.console = window.console || function (t) { };

if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
}

if ("access_token" in localStorage)
{
    window.location.replace("index.html");
}

function Registration()
{
    let username = document.querySelector("input#registrationname").value;
    let email = document.querySelector("input#registrationemail").value;
    let password = document.querySelector("input#registrationpw").value;
    let password_conf = document.querySelector("input#registrationpwconf").value;
    let map = new Map();
    map["name"] = username;
    map["email"] = email;
    map["password"] = password;
    map["password_confirmation"] = password_conf;
    map["is_admin"] = true;
    console.log(JSON.stringify(map));
    if (username == "" || email == "" || password == "" || password_conf == "")
    {
        alert("Tölts ki minden mezőt!");
        return;
    }
    fetch('http://localhost:8881/api/admin/registration', {
        method: "POST",
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(map)
    }).then((response) => response.json())
    .then((data) => {
        localStorage.setItem("access_token", data.access_token);
        localStorage.setItem("admin_id", data.user.id);
        localStorage.setItem("admin_name", data.user.name);
        localStorage.setItem("admin_email", data.user.email);
        localStorage.setItem("admin_is_admin", data.user.is_admin);
        window.location.replace("index.html");
    })
    .catch((err) => {
        console.log(err);
        alert("Ellenőrizd a beírt adatokat!");
    })
    
}

function Login()
{
    let email = document.querySelector("input#loginemail").value;
    let password = document.querySelector("input#loginpw").value;
    let map = new Map();
    map["email"] = email;
    map["password"] = password;
    console.log(JSON.stringify(map));
    if (email == "" || password == "")
    {
        alert("Tölts ki minden mezőt!");
        return;
    }
    fetch('http://localhost:8881/api/admin/login', {
        method: "POST",
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(map)
    }).then((response) => response.json())
    .then((data) => {
        console.log(data);
        if (!(data["message"] === undefined))
        {
            alert(data["message"]);
            return;
        }
        localStorage.setItem("access_token", data.access_token);
        localStorage.setItem("admin_id", data.user.id);
        localStorage.setItem("admin_name", data.user.name);
        localStorage.setItem("admin_email", data.user.email);
        localStorage.setItem("admin_is_admin", data.user.is_admin);
        window.location.replace("index.html");
    })
    .catch((err) => {
        console.log(err);
        alert("Ellenőrizd a beírt adatokat!");
    })
}
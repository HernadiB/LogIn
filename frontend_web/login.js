window.console = window.console || function (t) { };

if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
}

function Registration()
{
    let username = document.querySelector("input#registrationname").value;
    let password = document.querySelector("input#registrationpw").value;
    let array = new Array();
    array.push(username, password);
    console.log(JSON.stringify(array));
    fetch('http://localhost:8881/api/admin/registration', {
        method: "POST",
        headers: {
            "Content-type": "application/json",
        },
        body: JSON.stringify(array)
    }).then((res) => res.json())
    .then((data) => console.log(data))
    .catch((err) => console.log(err))
}

function Login()
{

}
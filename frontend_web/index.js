let container = document.createElement("div");
Page();

function Page()
{
    AccessToken();
    Container();
    OsszesFelhasznalo();
    FelhasznaloTorleseByID();
    LefoglaltIdopontok();
    FoglalasTorleseByID();
    FoglalasKeresesByUserID();
    IdopontFelvetel();
    IdopontTorles();
    LogoutButton();
    fetchGetAllUsers();
    fetchGetAllFoglalas();
}

function AccessToken()
{
    if (!("access_token" in localStorage))
    {
        window.location.replace("login.html");
    }
}

function Container()
{
    document.body.appendChild(container);
    container.classList.add("container");
    let h1 = document.createElement("h1");
    h1.innerText = "Admin felület";
    h1.classList.add("text-center")
    container.appendChild(h1);
}

function OsszesFelhasznalo()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Összes felhasználó";
    container.appendChild(h3);
    let table = document.createElement("table");
    table.id = "OsszesFelhasznaloTable";
    table.classList.add("table", "table-striped");
    let tr = document.createElement("tr");
    let th1 = document.createElement("th");
    let th2 = document.createElement("th");
    let th3 = document.createElement("th");
    th1.innerText = "Felhasználó ID";
    th2.innerText = "Felhasználó neve";
    th3.innerText = "Felhasználó e-mail címe";
    tr.append(th1, th2, th3);
    table.appendChild(tr);
    container.appendChild(table);
}

function FelhasznaloTorleseByID()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Felhasználó törlése ID alapján";
    container.appendChild(h3);
    let form = document.createElement("form");
    form.setAttribute("method", "post");
    form.name = "FelhasznaloTorleseByIDForm";
    let formgroup = document.createElement("div");
    formgroup.classList.add("form-group");
    let input = document.createElement("input");
    input.type = "number";
    input.classList.add("form-control");
    input.id = "DeleteUser";
    input.name = "DeleteUser";
    input.setAttribute("placeholder", "5");
    let button = document.createElement("button");
    button.setAttribute("type", "submit");
    button.onclick = DeleteUserByID;
    button.classList.add("btn", "btn-primary", "mt-2", "mb-2");
    button.innerText = "Küldés";
    formgroup.append(input, button);
    form.appendChild(formgroup);
    container.appendChild(form);
}

function LefoglaltIdopontok()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Összes foglalás";
    container.appendChild(h3);
    let table = document.createElement("table");
    table.id = "LefoglaltIdopontokTable";
    table.classList.add("table", "table-striped");
    let tr = document.createElement("tr");
    let th1 = document.createElement("th");
    th1.innerText = "Foglalás ID";
    tr.appendChild(th1);
    let th2 = document.createElement("th");
    th2.innerText = "Felhasználó neve";
    tr.appendChild(th2);
    let th3 = document.createElement("th");
    th3.innerText = "Foglalás kezdete";
    tr.appendChild(th3);
    let th4 = document.createElement("th");
    th4.innerText = "Foglalás vége";
    tr.appendChild(th4);
    table.appendChild(tr);
    container.appendChild(table);
}

function FoglalasTorleseByID()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Foglalás törlése Foglalás ID alapján";
    container.appendChild(h3);
    let form = document.createElement("form");
    form.setAttribute("method", "post");
    form.name = "FoglalasTorleseByIDForm";
    let formgroup = document.createElement("div");
    formgroup.classList.add("form-group");
    let input = document.createElement("input");
    input.type = "number";
    input.classList.add("form-control");
    input.id = "DeleteFoglalas";
    input.name = "DeleteFoglalas";
    input.setAttribute("placeholder", "10");
    let button = document.createElement("button");
    button.setAttribute("type", "submit");
    button.onclick = DeleteFoglalasByID;
    button.classList.add("btn", "btn-primary", "mt-2", "mb-2");
    button.innerText = "Küldés";
    formgroup.append(input, button);
    form.appendChild(formgroup);
    container.appendChild(form);
}

function FoglalasKeresesByUserID()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Foglalás keresése Felhasználó ID alapján";
    container.appendChild(h3);
    let table = document.createElement("table");
    table.id = "FoglalasKeresesByUserIDTable";
    table.classList.add("table", "table-striped", "d-none");
    let tr = document.createElement("tr");
    let th1 = document.createElement("th");
    th1.innerText = "Foglalás ID";
    tr.appendChild(th1);
    let th2 = document.createElement("th");
    th2.innerText = "Felhasználó ID";
    tr.appendChild(th2);
    let th3 = document.createElement("th");
    th3.innerText = "Felhasználó neve";
    tr.appendChild(th3);
    let th4 = document.createElement("th");
    th4.innerText = "Foglalás kezdete";
    tr.appendChild(th4);
    let th5 = document.createElement("th");
    th5.innerText = "Foglalás vége";
    tr.appendChild(th5);
    table.appendChild(tr);
    container.appendChild(table);
    let form = document.createElement("form");
    form.setAttribute("method", "post");
    form.name = "FoglalasKeresesByUserIDForm";
    let formgroup = document.createElement("div");
    formgroup.classList.add("form-group");
    let input = document.createElement("input");
    input.type = "number";
    input.classList.add("form-control");
    input.id = "FoglalasKereses";
    input.name = "FoglalasKereses";
    input.setAttribute("placeholder", "15");
    let button = document.createElement("button");
    button.setAttribute("type", "submit");
    button.onclick = fetchGetFoglalasByUserID;
    button.classList.add("btn", "btn-primary", "mt-2", "mb-2");
    button.innerText = "Küldés";
    formgroup.append(input, button);
    form.appendChild(formgroup);
    container.appendChild(form);
}

function IdopontFelvetel()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Új időpont felvétele";
    container.appendChild(h3);
    let form = document.createElement("form");
    form.setAttribute("method", "post");
    form.name = "IdopontFelvetelForm";
    let formgroup1 = document.createElement("div");
    formgroup1.classList.add("form-group");
    let label1 = document.createElement("label");
    label1.setAttribute("for", "IdopontFelvetelInput1");
    label1.innerText = "Év:";
    formgroup1.appendChild(label1);
    let input1 = document.createElement("input");
    input1.type = "text";
    input1.classList.add("form-control");
    input1.id = "IdopontFelvetelInput1";
    input1.name = "IdopontFelvetelInput1";
    input1.setAttribute("placeholder", "2022");
    formgroup1.appendChild(input1);
    form.appendChild(formgroup1);
    let formgroup2 = document.createElement("div");
    formgroup2.classList.add("form-group");
    let label2 = document.createElement("label");
    label2.setAttribute("for", "IdopontFelvetelInput2");
    label2.innerText = "Hónap:";
    formgroup2.appendChild(label2);
    let input2 = document.createElement("input");
    input2.type = "text";
    input2.classList.add("form-control");
    input2.id = "IdopontFelvetelInput2";
    input2.name = "IdopontFelvetelInput2";
    input2.setAttribute("placeholder", "02");
    formgroup2.appendChild(input2);
    form.appendChild(formgroup2);
    let formgroup3 = document.createElement("div");
    formgroup3.classList.add("form-group");
    let label3 = document.createElement("label");
    label3.setAttribute("for", "IdopontFelvetelInput3");
    label3.innerText = "Nap:";
    formgroup3.appendChild(label3);
    let input3 = document.createElement("input");
    input3.type = "text";
    input3.classList.add("form-control");
    input3.id = "IdopontFelvetelInput3";
    input3.name = "IdopontFelvetelInput3";
    input3.setAttribute("placeholder", "05");
    formgroup3.appendChild(input3);
    form.appendChild(formgroup3);
    let formgroup4 = document.createElement("div");
    formgroup4.classList.add("form-group");
    let label4 = document.createElement("label");
    label4.setAttribute("for", "IdopontFelvetelInput4");
    label4.innerText = "Óra (-tól):";
    formgroup4.appendChild(label4);
    let input4 = document.createElement("input");
    input4.type = "text";
    input4.classList.add("form-control");
    input4.id = "IdopontFelvetelInput4";
    input4.name = "IdopontFelvetelInput4";
    input4.setAttribute("placeholder", "16");
    formgroup4.appendChild(input4);
    form.appendChild(formgroup4);
    let formgroup5 = document.createElement("div");
    formgroup5.classList.add("form-group");
    let label5 = document.createElement("label");
    label5.setAttribute("for", "IdopontFelvetelInput5");
    label5.innerText = "Óra (-ig):";
    formgroup5.appendChild(label5);
    let input5 = document.createElement("input");
    input5.type = "text";
    input5.classList.add("form-control");
    input5.id = "IdopontFelvetelInput5";
    input5.name = "IdopontFelvetelInput5";
    input5.setAttribute("placeholder", "17");
    formgroup5.appendChild(input5);
    form.appendChild(formgroup5);
    let button = document.createElement("button");
    button.setAttribute("type", "submit");
    button.classList.add("btn", "btn-primary", "mb-2");
    button.innerText = "Küldés";
    button.onclick = AddIdopont;
    form.appendChild(button);
    container.appendChild(form);
}

function IdopontTorles()
{
    let h3 = document.createElement("h3");
    h3.innerText = "Időpont törlése";
    container.appendChild(h3);
    let form = document.createElement("form");
    form.setAttribute("method", "post");
    form.name = "IdopontTorlesForm";
    let formgroup1 = document.createElement("div");
    formgroup1.classList.add("form-group");
    let label1 = document.createElement("label");
    label1.setAttribute("for", "IdopontTorlesInput1");
    label1.innerText = "Év:";
    formgroup1.appendChild(label1);
    let input1 = document.createElement("input");
    input1.type = "text";
    input1.classList.add("form-control");
    input1.id = "IdopontTorlesInput1";
    input1.name = "IdopontTorlesInput1";
    input1.setAttribute("placeholder", "2022");
    formgroup1.appendChild(input1);
    form.appendChild(formgroup1);
    let formgroup2 = document.createElement("div");
    formgroup2.classList.add("form-group");
    let label2 = document.createElement("label");
    label2.setAttribute("for", "IdopontTorlesInput2");
    label2.innerText = "Hónap:";
    formgroup2.appendChild(label2);
    let input2 = document.createElement("input");
    input2.type = "text";
    input2.classList.add("form-control");
    input2.id = "IdopontTorlesInput2";
    input2.name = "IdopontTorlesInput2";
    input2.setAttribute("placeholder", "01");
    formgroup2.appendChild(input2);
    form.appendChild(formgroup2);
    let formgroup3 = document.createElement("div");
    formgroup3.classList.add("form-group");
    let label3 = document.createElement("label");
    label3.setAttribute("for", "IdopontTorlesInput3");
    label3.innerText = "Nap:";
    formgroup3.appendChild(label3);
    let input3 = document.createElement("input");
    input3.type = "text";
    input3.classList.add("form-control");
    input3.id = "IdopontTorlesInput3";
    input3.name = "IdopontTorlesInput3";
    input3.setAttribute("placeholder", "31");
    formgroup3.appendChild(input3);
    form.appendChild(formgroup3);
    let formgroup4 = document.createElement("div");
    formgroup4.classList.add("form-group");
    let label4 = document.createElement("label");
    label4.setAttribute("for", "IdopontTorlesInput4");
    label4.innerText = "Óra (-tól):";
    formgroup4.appendChild(label4);
    let input4 = document.createElement("input");
    input4.type = "text";
    input4.classList.add("form-control");
    input4.id = "IdopontTorlesInput4";
    input4.name = "IdopontTorlesInput4";
    input4.setAttribute("placeholder", "10");
    formgroup4.appendChild(input4);
    form.appendChild(formgroup4);
    let formgroup5 = document.createElement("div");
    formgroup5.classList.add("form-group");
    let label5 = document.createElement("label");
    label5.setAttribute("for", "IdopontTorlesInput5");
    label5.innerText = "Óra (-ig):";
    formgroup5.appendChild(label5);
    let input5 = document.createElement("input");
    input5.type = "text";
    input5.classList.add("form-control");
    input5.id = "IdopontTorlesInput5";
    input5.name = "IdopontTorlesInput5";
    input5.setAttribute("placeholder", "11");
    formgroup5.appendChild(input5);
    form.appendChild(formgroup5);
    let button = document.createElement("button");
    button.setAttribute("type", "submit");
    button.classList.add("btn", "btn-primary", "mb-2");
    button.innerText = "Küldés";
    button.onclick = DeleteIdopont;
    form.appendChild(button);
    container.appendChild(form);
}

function LogoutButton()
{
    let col = document.createElement("div");
    col.classList.add("mx-auto", "col-1", "mt-3", "mb-3");
    let button = document.createElement("button");
    button.classList.add("btn", "btn-danger");
    button.innerText = "Kijelentkezés";
    button.onclick = AdminLogout;
    col.appendChild(button);
    container.appendChild(col);
}

function AdminLogout()
{
    localStorage.removeItem("access_token");
    localStorage.removeItem("admin_id");
    localStorage.removeItem("admin_name");
    localStorage.removeItem("admin_email");
    localStorage.removeItem("admin_is_admin");
    window.location.replace("login.html");
}


async function fetchGetAllFoglalas(){
    let response = await fetch('http://localhost:8881/api/admin/foglalas');
    let data = await response.json();
    let table = document.querySelector("table#LefoglaltIdopontokTable");
    data.forEach(item => {
        let tr = document.createElement("tr");
        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        td1.innerText = item.ID;
        td2.innerText = item.Username;
        td3.innerText = item.From;
        td4.innerText = item.To;
        tr.append(td1, td2, td3, td4);
        table.append(tr);
    });
}

async function fetchGetFoglalasByUserID(event){
    event.preventDefault();
    let userID = document.querySelector("input#FoglalasKereses").value;
    if (userID == "")
    {
        alert("Töltsd ki a mezőt!");
        return;
    }
    let response = await fetch(`http://localhost:8881/api/admin/foglalas/${userID}`);
    let data = await response.json();
    if (!(data["message"] === undefined))
    {
        alert(data["message"]);
        return;
    }
    let table = document.querySelector("table#FoglalasKeresesByUserIDTable");
    table.classList.remove("d-none");
    let tr = document.createElement("tr");
    let td1 = document.createElement("td");
    let td2 = document.createElement("td");
    let td3 = document.createElement("td");
    let td4 = document.createElement("td");
    let td5 = document.createElement("td");
    td1.innerText = data.Foglalas_ID;
    td2.innerText = data.User_ID;
    td3.innerText = data.Username;
    td4.innerText = data.From;
    td5.innerText = data.To;
    tr.append(td1, td2, td3, td4, td5);
    table.appendChild(tr);
}

async function fetchGetAllUsers(){
    let response = await fetch('http://localhost:8881/api/admin/users');
    let data = await response.json();
    let table = document.querySelector("table#OsszesFelhasznaloTable");
    data.forEach(item => {
        let tr = document.createElement("tr");
        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        td1.innerText = item.ID;
        td2.innerText = item.Username;
        td3.innerText = item.Email;
        tr.append(td1, td2, td3);
        table.appendChild(tr);
    });
}

function DeleteUserByID(event)
{
    event.preventDefault();
    let userID = document.querySelector("input#DeleteUser").value;
    if (userID == "")
    {
        alert("Töltsd ki a mezőt!");
        return;
    }
    fetch(`http://localhost:8881/api/admin/users/${userID}`, {
        method: "DELETE",
        headers: {
            "Content-type": "application/json",
            // "Authorization": "Bearer " + localStorage.getItem("access_token")
        }
    }).then((res) => res.json())
    .then((data) =>
    {
        console.log(data);
        if (!(data["message"] === undefined))
        {
            alert(data["message"]);
            return;
        }
    })
    .catch((err) => console.log(err))
}

function DeleteFoglalasByID(event)
{
    event.preventDefault();
    let foglalasID = document.querySelector("input#DeleteFoglalas").value;
    if (foglalasID == "")
    {
        alert("Töltsd ki a mezőt!");
        return;
    }
    fetch(`http://localhost:8881/api/admin/foglalas/${foglalasID}`, {
        method: "DELETE",
        headers: {
            "Content-type": "application/json",
            // "Authorization": "Bearer " + localStorage.getItem("access_token")
        }
    }).then((res) => res.json())
    .then((data) =>
    {
        console.log(data);
        if (!(data["message"] === undefined))
        {
            alert(data["message"]);
            return;
        }
    })
    .catch((err) => console.log(err))
}

function DeleteIdopont(event)
{
    event.preventDefault();
    let year = document.querySelector("input#IdopontTorlesInput1").value;
    let month = document.querySelector("input#IdopontTorlesInput2").value;
    let day = document.querySelector("input#IdopontTorlesInput3").value;
    let from = document.querySelector("input#IdopontTorlesInput4").value;
    let to = document.querySelector("input#IdopontTorlesInput5").value;
    if (month.length != 2 || day.length != 2 || from.length != 2 || to.length != 2)
    {
        alert("Figyelj a formátumra! Ha 1 számot adsz meg, rakj elé egy nullát! (Pl. '05')");
        return;
    }
    if (year < 2022 || year > 2030 || month < 1 || month > 12 || day < 1 || day > 31 || from < 0 || from > 23 || to < 0 || to > 23)
    {
        alert("Helytelen dátumot adtál meg!");
        return;
    }
    if (to-from != 1)
    {
        alert("Csak 1 órás intervallumot adhatsz meg!");
        return;
    }
    let datetimefrom = year.concat("-", month, "-", day, " ", from, ":00:00");
    let datetimeto = year.concat("-", month, "-", day, " ", to, ":00:00");
    let array = new Array();
    array.push(datetimefrom);
    array.push(datetimeto);
    fetch('http://localhost:8881/api/admin/idopont', {
        method: "DELETE",
        headers: {
            "Content-type": "application/json",
            // "Authorization": "Bearer " + localStorage.getItem("access_token")
        },
        body: JSON.stringify(array)
    }).then((res) => res.json())
    .then((data) =>
    {
        console.log(data);
        if (!(data["message"] === undefined))
        {
            alert(data["message"]);
            return;
        }
    })
    .catch((err) => console.log(err))
}

function AddIdopont(event)
{
    event.preventDefault();
    let year = document.querySelector("input#IdopontFelvetelInput1").value;
    let month = document.querySelector("input#IdopontFelvetelInput2").value;
    let day = document.querySelector("input#IdopontFelvetelInput3").value;
    let from = document.querySelector("input#IdopontFelvetelInput4").value;
    let to = document.querySelector("input#IdopontFelvetelInput5").value;
    if (month.length != 2 || day.length != 2 || from.length != 2 || to.length != 2)
    {
        alert("Figyelj a formátumra! Ha 1 számot adsz meg, rakj elé egy nullát! (Pl. '05')");
        return;
    }
    if (year < 2022 || year > 2030 || month < 1 || month > 12 || day < 1 || day > 31 || from < 0 || from > 23 || to < 0 || to > 23)
    {
        alert("Helytelen dátumot adtál meg!");
        return;
    }
    if (to-from != 1)
    {
        alert("Csak 1 órás intervallumot adhatsz meg!");
        return;
    }
    let datetimefrom = year.concat("-", month, "-", day, " ", from, ":00:00");
    let datetimeto = year.concat("-", month, "-", day, " ", to, ":00:00");
    let array = new Array();
    array.push(datetimefrom);
    array.push(datetimeto);
    fetch('http://localhost:8881/api/admin/idopont', {
        method: "POST",
        headers: {
            "Content-type": "application/json",
            // "Authorization": "Bearer " + localStorage.getItem("access_token")
        },
        body: JSON.stringify(array)
    }).then((res) => res.json())
    .then((data) =>
    {
        console.log(data);
        if (!(data["message"] === undefined))
        {
            alert(data["message"]);
            return;
        }
    })
    .catch((err) => console.log(err))
}
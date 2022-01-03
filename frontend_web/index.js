let container = document.createElement("div");
document.body.appendChild(container);
container.classList.add("container");

let h1 = document.createElement("h1");
h1.innerText = "Admin felület";
h1.classList.add("text-center")

container.appendChild(h1);
let h3_1 = document.createElement("h3");
h3_1.innerText = "Lefoglalt időpontok";
container.appendChild(h3_1);

let table = document.createElement("table");
table.classList.add("table");
table.classList.add("table-striped");
let tr = document.createElement("tr");
let th_1 = document.createElement("th");
th_1.innerText = "Felhasználó neve";
tr.appendChild(th_1);
let th_2 = document.createElement("th");
th_2.innerText = "Foglalás kezdete";
tr.appendChild(th_2);
let th_3 = document.createElement("th");
th_3.innerText = "Foglalás vége";
tr.appendChild(th_3);
table.appendChild(tr);
let tr2 = document.createElement("tr");
let td_1 = document.createElement("td");
td_1.innerText = "test1";
tr2.appendChild(td_1);
let td_2 = document.createElement("td");
td_2.innerText = "test2";
tr2.appendChild(td_2);
let td_3 = document.createElement("td");
td_3.innerText = "test3";
tr2.appendChild(td_3);
table.appendChild(tr2);
let tr3 = document.createElement("tr");
let td_4 = document.createElement("td");
td_4.innerText = "test4";
tr3.appendChild(td_4);
let td_5 = document.createElement("td");
td_5.innerText = "test5";
tr3.appendChild(td_5);
let td_6 = document.createElement("td");
td_6.innerText = "test6";
tr3.appendChild(td_6);
table.appendChild(tr3);
container.appendChild(table);

let h3_2 = document.createElement("h3");
h3_2.innerText = "Új időpont felvétele";
h3_2.classList.add("mt-3");
container.appendChild(h3_2);

let form = document.createElement("form");
form.setAttribute("method", "post");
form.name = "form1";
let formgroup1 = document.createElement("div");
formgroup1.classList.add("form-group");
let label1 = document.createElement("label");
label1.setAttribute("for", "year");
label1.innerText = "Év:";
formgroup1.appendChild(label1);
let input1 = document.createElement("input");
input1.type = "text";
input1.classList.add("form-control");
input1.id = "year";
input1.name = "label1";
input1.setAttribute("placeholder", "2022");
formgroup1.appendChild(input1);
form.appendChild(formgroup1);
let formgroup2 = document.createElement("div");
formgroup2.classList.add("form-group");
let label2 = document.createElement("label");
label2.setAttribute("for", "month");
label2.innerText = "Hónap:";
formgroup2.appendChild(label2);
let input2 = document.createElement("input");
input2.type = "text";
input2.classList.add("form-control");
input2.id = "month";
input2.name = "label2";
input2.setAttribute("placeholder", "1");
formgroup2.appendChild(input2);
form.appendChild(formgroup2);
let formgroup3 = document.createElement("div");
formgroup3.classList.add("form-group");
let label3 = document.createElement("label");
label3.setAttribute("for", "day");
label3.innerText = "Nap:";
formgroup3.appendChild(label3);
let input3 = document.createElement("input");
input3.type = "text";
input3.classList.add("form-control");
input3.id = "day";
input3.name = "label3";
input3.setAttribute("placeholder", "12");
formgroup3.appendChild(input3);
form.appendChild(formgroup3);
let formgroup4 = document.createElement("div");
formgroup4.classList.add("form-group");
let label4 = document.createElement("label");
label4.setAttribute("for", "hourfrom");
label4.innerText = "Óra (-tól):";
formgroup4.appendChild(label4);
let input4 = document.createElement("input");
input4.type = "text";
input4.classList.add("form-control");
input4.id = "hourfrom";
input4.name = "label4";
input4.setAttribute("placeholder", "6");
formgroup4.appendChild(input4);
form.appendChild(formgroup4);
let formgroup5 = document.createElement("div");
formgroup5.classList.add("form-group");
let label5 = document.createElement("label");
label5.setAttribute("for", "hourto");
label5.innerText = "Óra (-ig):";
formgroup5.appendChild(label5);
let input5 = document.createElement("input");
input5.type = "text";
input5.classList.add("form-control");
input5.id = "hourto";
input5.name = "label5";
input5.setAttribute("placeholder", "7");
formgroup5.appendChild(input5);
form.appendChild(formgroup5);
let button = document.createElement("button");
button.setAttribute("type", "submit");
button.classList.add("btn");
button.classList.add("btn-primary");
button.innerText = "Küldés";
button.setAttribute("onclick", "func1()");
form.appendChild(button);
container.appendChild(form);

let h3_3 = document.createElement("h3");
h3_3.innerText = "Időpont törlése";
h3_3.classList.add("mt-4");
container.appendChild(h3_3);

let form2 = document.createElement("form");
form2.setAttribute("method", "post");
form2.name = "form2";
let formgroup6 = document.createElement("div");
formgroup6.classList.add("form-group");
let label6 = document.createElement("label");
label6.setAttribute("for", "year2");
label6.innerText = "Év:";
formgroup6.appendChild(label6);
let input6 = document.createElement("input");
input6.type = "text";
input6.classList.add("form-control");
input6.id = "year2";
input6.name = "label6";
input6.setAttribute("placeholder", "2022");
formgroup6.appendChild(input6);
form2.appendChild(formgroup6);
let formgroup7 = document.createElement("div");
formgroup7.classList.add("form-group");
let label7 = document.createElement("label");
label7.setAttribute("for", "month2");
label7.innerText = "Hónap:";
formgroup7.appendChild(label7);
let input7 = document.createElement("input");
input7.type = "text";
input7.classList.add("form-control");
input7.id = "month2";
input7.name = "label7";
input7.setAttribute("placeholder", "1");
formgroup7.appendChild(input7);
form2.appendChild(formgroup7);
let formgroup8 = document.createElement("div");
formgroup8.classList.add("form-group");
let label8 = document.createElement("label");
label8.setAttribute("for", "day2");
label8.innerText = "Nap:";
formgroup8.appendChild(label8);
let input8 = document.createElement("input");
input8.type = "text";
input8.classList.add("form-control");
input8.id = "day2";
input8.name = "label8";
input8.setAttribute("placeholder", "31");
formgroup8.appendChild(input8);
form2.appendChild(formgroup8);
let formgroup9 = document.createElement("div");
formgroup9.classList.add("form-group");
let label9 = document.createElement("label");
label9.setAttribute("for", "hourfrom2");
label9.innerText = "Óra (-tól):";
formgroup9.appendChild(label9);
let input9 = document.createElement("input");
input9.type = "text";
input9.classList.add("form-control");
input9.id = "hourfrom2";
input9.name = "label9";
input9.setAttribute("placeholder", "22");
formgroup9.appendChild(input9);
form2.appendChild(formgroup9);
let formgroup10 = document.createElement("div");
formgroup10.classList.add("form-group");
let label10 = document.createElement("label");
label10.setAttribute("for", "hourto2");
label10.innerText = "Óra (-ig):";
formgroup10.appendChild(label10);
let input10 = document.createElement("input");
input10.type = "text";
input10.classList.add("form-control");
input10.id = "hourto2";
input10.name = "label10";
input10.setAttribute("placeholder", "23");
formgroup10.appendChild(input10);
form2.appendChild(formgroup10);
let button2 = document.createElement("button");
button2.setAttribute("type", "submit");
button2.classList.add("btn");
button2.classList.add("btn-primary");
button2.innerText = "Küldés";
button2.setAttribute("onclick", "func2()");
form2.appendChild(button2);
container.appendChild(form2);

let h3_4 = document.createElement("h3");
h3_4.innerText = "Felhasználó törlése";
h3_4.classList.add("mt-3");
container.appendChild(h3_4);

let form3 = document.createElement("form");
form3.setAttribute("method", "post");
form3.name = "form3";
let formgroup11 = document.createElement("div");
formgroup11.classList.add("form-group");
let label11 = document.createElement("label");
label11.setAttribute("for", "name");
label11.innerText = "Név:";
formgroup11.appendChild(label11);
let input11 = document.createElement("input");
input11.type = "text";
input11.classList.add("form-control");
input11.id = "name";
input11.name = "label11";
input11.setAttribute("placeholder", "User1");
formgroup11.appendChild(input11);
form3.appendChild(formgroup11);
let button3 = document.createElement("button");
button3.setAttribute("type", "submit");
button3.classList.add("btn");
button3.classList.add("btn-primary");
button3.innerText = "Küldés";
button3.setAttribute("onclick", "func3()");
form3.appendChild(button3);
container.appendChild(form3);

function func1()
{
    let a = document.forms["form1"]["label1"].value;
    let b = document.forms["form1"]["label2"].value;
    let c = document.forms["form1"]["label3"].value;
    let d = document.forms["form1"]["label4"].value;
    let e = document.forms["form1"]["label5"].value;
    if (a == "" || b == "" || c == "" || d == "" || e == "")
    {
        alert("Hiányzó érték(ek)!");
    }
}
function func2()
{
    let a = document.forms["form2"]["label6"].value;
    let b = document.forms["form2"]["label7"].value;
    let c = document.forms["form2"]["label8"].value;
    let d = document.forms["form2"]["label9"].value;
    let e = document.forms["form2"]["label10"].value;
    if (a == "" || b == "" || c == "" || d == "" || e == "")
    {
        alert("Hiányzó érték(ek)!");
    }
}
function func3()
{
    let a = document.forms["form3"]["label11"].value;
    if (a == "")
    {
        alert("Hiányzó érték!");
    }
}
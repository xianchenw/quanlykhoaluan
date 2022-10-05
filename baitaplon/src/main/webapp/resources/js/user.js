/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function loadStudent(id){
    var a = document.getElementById("list-userrole");
    if(a.value==4){
        fetch('/baitaplon/api/user/addStudent',{
            method:'post',
            body: JSON.stringify({
                'studentId' : id
            }),
            headers:{
                'Content-Type':'application/json'
            }
        }).then(res=>{
            return res.json();
        }).then(data=>{
            if(data[0]==1){
                console.log(data[1]);
                fillStudent(data[1]);
            }
            else{
                alert(data[2]);
                document.getElementById('id').value = 'SV';     
                refresh();
            }
        })
    }
}

function loadListStudent(){
    fetch('/baitaplon/api/user/loadStudentAccount',{
        method:'get',
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res =>{
        return res.json();
    }).then(data =>{
        var a = document.getElementById('listStudent');
        a.innerHTML = ``;
        for(var item in data){
            var option = document.createElement("option");
            option.text = data[item].id + " - " + data[item].firstName + " " + data[item].lastName;
            option.value = data[item].id;
            a.add(option);
            console.log(option.text);
        }
    })
}

function selectStudent(id){
    fetch('/baitaplon/api/user/selectStudent',{
        method:'post',
        body: JSON.stringify({
            'studentId' : id
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res=>{
        return res.json();
    }).then(data=>{
        fillStudent(data);
        console.log(data);
    })
}

function fillStudent(student){
    document.getElementById('id').value = student.id;
    document.getElementById('first-name').value = student.firstName;
    document.getElementById('last-name').value = student.lastName;
    document.getElementById('email').value = student.email;
    document.getElementById('phone-number').value = student.phoneNumber;
    document.getElementById('birthday').value = new Date(Date.parse(student.birthday)).toLocaleDateString('fr-CA');
}

function refresh(){
    document.getElementById('id').value = "SV";
    document.getElementById('first-name').value = "";
    document.getElementById('last-name').value = "";
    document.getElementById('email').value = "";
    document.getElementById('phone-number').value = "";
    document.getElementById('birthday').value = "";
}


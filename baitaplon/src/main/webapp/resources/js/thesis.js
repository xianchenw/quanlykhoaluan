/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

function changeReviewer(reviewerId){
    console.log(reviewerId);
    fetch(`/baitaplon/api/thesis/user`,{
        method:'put',
        body: JSON.stringify({
            'userId': reviewerId
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res=>{
        return res.json();
    }).then(data =>{
        console.log(data);
        document.getElementById('reviewerIdLabel').innerText = data.id;
        document.getElementById('reviewerNameLabel').innerText = data.firstName + " " + data.lastName;
    })
}

function addReviewer(reviewerId){
    console.log(reviewerId)
    fetch(`/baitaplon/api/thesis/user`,{
        method:'put',
        body: JSON.stringify({
            'userId': reviewerId
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res=>{
        return res.json();
    }).then(data =>{
        console.log(data);
        document.getElementById('reviewerLabel').innerHTML = `
            <span id="reviewerIdLabel">${data.id}</span> 
            - <span id="reviewerNameLabel">${data.firstName} ${data.lastName}</span>`;
    })
}

function changeStudent(studentId, cellId, cellName){
    console.log(studentId);
    console.log(cellId.innerText);
    console.log(cellName.innerText);
    fetch(`/baitaplon/api/thesis/student`,{
        method:'put',
        body: JSON.stringify({
            'studentId': studentId
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res=>{
        return res.json();
    }).then(data =>{
        console.log(data);
        cellId.innerText = data.id;
        cellName.innerText = data.firstName + " " + data.lastName;
    })
}

function addStudent(studentId, cellId, cellName){
    changeStudent(studentId, cellId, cellName);
}

function changeInstructor(instructorId, cellId, cellName){
    console.log(instructorId)
    fetch(`/baitaplon/api/thesis/user`,{
        method:'put',
        body: JSON.stringify({
            'userId': instructorId
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res=>{
        return res.json();
    }).then(data =>{
        console.log(data);
        cellId.innerText = data.id;
        cellName.innerText = data.firstName + " " + data.lastName;
    })
}

function addInstructor(instructorId, cellId, cellName){
    changeInstructor(instructorId, cellId, cellName);
}

function editThesis(thesisId, topic, description, reviewer, students, instructors){
    console.log(thesisId, topic, description, reviewer);
    for(let i=0;i<instructors.rows.length-1;i++){
        console.log(instructors.rows[i+1].cells.item(0).innerText);
    }
    var st1 = students.rows[1].cells.item(0).innerText;
    var st2 = students.rows[2].cells.item(0).innerText;
    var ins1 = instructors.rows[1].cells.item(0).innerText;
    var ins2 = instructors.rows[2].cells.item(0).innerText;
    console.log(st1, st2, ins1, ins2);
    fetch('/baitaplon/api/thesis/edit',{
        method:'post',
        body: JSON.stringify({
            "thesisId": thesisId,
            "topic": topic,
            "description": description,
            "reviewerId": reviewer,
            "student1": st1,
            "student2": st2,
            "instructor1": ins1,
            "instructor2": ins2
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res => {
        console.log(res.json());
        return res.json();
    }).then(data=>{
        console.log(data);
    })
}



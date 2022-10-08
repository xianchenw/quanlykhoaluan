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

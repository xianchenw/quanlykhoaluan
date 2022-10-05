/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function loadStudent(id){
    fetch('/baitaplon/user/addStudent',{
        method:'post',
        body: JSON.stringify({
            'studentId' : id
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res=>{
        console.log(res.json());
        return res.json();
    }).then(data=>{
        console.log(data);
    })
}


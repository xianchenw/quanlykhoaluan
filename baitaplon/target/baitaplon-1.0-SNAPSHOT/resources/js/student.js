/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function loadClass(e){
    console.log(e.value);
    const id = e.value.toString();
    console.log(id);
    fetch('/baitaplon/api/student',{
        method:'post',
        body: JSON.stringify({
            'majorId':id
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res => {
        return res.json();
    }).then(data=>{
        console.log(data);
        
        let area = document.getElementById("classSelected");
        for (var item in data) {
            console.log(data[item].name);            
            area.innerHTML = `<option value="${data[item].id}">${data[item].name}</option> ` + area.innerHTML;
        }
    })
}




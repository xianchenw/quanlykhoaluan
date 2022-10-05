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
        area.innerHTML = ``;
        if(data.length<=0){
            document.getElementById('note').innerHTML = `<span class="badge badge-pill badge-danger">Không tìm thấy danh sách lớp thuộc khoa này, vui lòng thêm lớp trước !</span>`;
        }
        else{
            document.getElementById('note').innerHTML = ``;
        }
        for(var item in data){
            var option = document.createElement("option");
            option.text = data[item].name;
            option.value = data[item].id;
            area.add(option);
            console.log(option.text);
        }
    })
}

function filterByMajor(id){
    fetch(`/baitaplon/api/student`,{
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
        var a = document.getElementById('table-body');
        var b = document.getElementById('major-filter');
        a.innerHTML= ``;
        for (var item in data){
            a.innerHTML = `<tr>
                                <td>${data[item].name}</td>
                                <td>${b.options[b.selectedIndex].innerText}</td>
                            </tr>` + a.innerHTML;
        }
        
    })
}




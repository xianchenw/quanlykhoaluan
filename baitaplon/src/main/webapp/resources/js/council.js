/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function addCouncil(name, president, secretary, reviewer, member1, member2){
    fetch('/baitaplon/api/council/add',{
        method:'post',
        body: JSON.stringify({
            "name": name.value,
            "presidentId": president.value,
            "secretaryId": secretary.value,
            "reviewerId": reviewer.value,
            "member1Id": member1.value,
            "member2Id": member2.values
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res =>{
        return res.json();
    }).then(data =>{
        console.log(data);
        location.reload();
    })
}

function removeMember(row,quantity){
    row.remove();
    checkQuantityMember(document.getElementById('tableMember'), quantity, document.getElementById('addMemberArea'));
}

function changeMember(id, name, nameCell, idCell){
    let isMember = checkMember(id,name);
    if(isMember){
        alert("Thành viên đã có trong hội đồng!!!");
    }
    else{
        idCell.innerText = id;
        nameCell.innerText = name;
    }
}

function checkMember(id,name){
    let isMember = false;
    const tbMember = document.getElementById('tableMember');
    for(let i = 0; i<tbMember.rows.length-1;i++)
    {
        if(id.toString()==tbMember.rows[i+1].cells.item(0).innerText.toString())
        {
            isMember = true;
        }
        console.log(id.toString(), tbMember.rows[i+1].cells.item(0).innerText.toString(), isMember);
    }
    return isMember;
}

function editCouncil(id, president, secretary, reviewer, members){
    console.log(id);
    var member1Id = "";
    var member2Id = "";
    var presidentId = president.cells.item(0).innerText;
    var secretaryId = secretary.cells.item(0).innerText;
    var reviewerId = reviewer.cells.item(0).innerText;
    if(members.length==1){
        member1Id = members[0].cells.item(0).innerText;
    }
    if(members.length==2){
        member1Id = members[0].cells.item(0).innerText;
        member2Id = members[1].cells.item(0).innerText;
    }
    fetch('/baitaplon/api/council/edit',{
        method:'post',
        body: JSON.stringify({
            "councilId": id,
            "presidentId": presidentId,
            "secretaryId": secretaryId,
            "reviewerId": reviewerId,
            "member1Id": member1Id,
            "member2Id": member2Id
        }),
        headers:{
            'Content-Type':'application/json'
        }
    }).then(res =>{
        return res.json();
    }).then(data =>{
        console.log(data);
        location.reload();
        document.getElementById('message').innerHTML = `<div class="alert alert-success" role="alert">
                                                            Đã cập nhật thành công ^^ !
                                                          </div>`;
    })
}


function showFilter() {
    document.getElementById("myFilter").classList.toggle("show");
}

function findTeacher() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myFilter");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}

function checkQuantityMember(table, quantity, divAdd){
    if(table.rows.length>quantity){
        divAdd.style.display = "none";
    }
    else{
        divAdd.style.display = "block";
    }
}






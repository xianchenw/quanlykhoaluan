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


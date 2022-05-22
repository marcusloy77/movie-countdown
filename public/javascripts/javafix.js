
var dueDate = document.getElementById("count")
var s = "2013-07-11"

// function dateParser(domDate){
//     let splitDom = domDate.split("-")
//     let releaseDate = new Date(splitDom[0], splitDom[1] + 1, splitDom[2])

//     return releaseDate
// }
setInterval(function(){
    //console.log(dueDate)
    console.log(dueDate)
    let today = new Date();
    let date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let dateTime = date+' '+time;
    document.querySelector('#count').textContent = dateTime
    //console.log(dateTime - dateParser(dueDate))
}, 1000)


//"2013-07-11"



//todo - read actual date in, string parse release date, count actual date down




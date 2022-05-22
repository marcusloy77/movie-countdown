var dueDate = document.getElementById("count").textContent
var s = "2013-07-11"

function dateParser(domDate){
    let splitDom = domDate.split("-")
    //console.log(splitDom)
    let releaseDate = new Date(Number(splitDom[0]), Number(splitDom[1] - 1), Number(splitDom[2]))

    return releaseDate
}
setInterval(function(){
    //console.log(dueDate)
    //console.log(dueDate)
    let today = new Date();
    let date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let dateTime = date+' '+time;
    //
    countdown = dateParser(dueDate) - today
    let secondsUntil = Math.floor(countdown / 1000)
    let mintuesUntil = Math.floor(secondsUntil / 60)
    let hoursUntil = Math.floor(mintuesUntil / 60)
    let daysUntil = Math.floor(hoursUntil / 24)
    
    document.querySelector('#count').textContent = String(daysUntil) + " days, " +String(hoursUntil % 24) + " hours, " +String(mintuesUntil % 60) +" minutes, and  " + String(secondsUntil % 60) +" seconds until release."
}, 1000)

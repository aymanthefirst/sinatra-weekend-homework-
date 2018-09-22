// $(document).ready(function(){
newNum = 0;

if (localStorage.getItem('viewCount') === null) //checks if it doesn't exists
{
  localStorage.setItem('viewCount', 1);
}
else {
  newNum = parseInt(localStorage.getItem('viewCount'))+1;
  localStorage.setItem('viewCount', newNum);
}


if (localStorage.getItem('pages') === null) //checks if it doesn't exists
{
  var pages = [];
pages[0] = "index";>>>
localStorage.setItem("pages", JSON.stringify(pages));// changes string to array
}
else {
  var storedNames = JSON.parse(localStorage.getItem("pages"));// changes array to string
}


console.log(JSON.parse(localStorage.getItem("pages")));
// } // end of js

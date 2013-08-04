// Extract uploaded image files' name from http://jsdo.it/mstssk/bals_clock2013/edit
// Execute following codes in Google Chrome Debug Console
var list = Array.prototype.slice.call(document.querySelectorAll(".unitFile")).map(function(group){ 
	var result = {};
	result.name = group.querySelector(".name").textContent;
	result.path = group.querySelector(".path input").value;
	return result; 
});
for(var index in list){
	console.log(list[index].name + "\t" + list[index].path)
}

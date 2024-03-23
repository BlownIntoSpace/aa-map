d3.csv("dwarvish.csv").then(function (data) {
  // console.log(data);

  var dictionary = data;

  var button = d3.select("#button");

  var form = d3.select("#form");

  button.on("click", runEnter);
  form.on("submit", runEnter);

  function runEnter() {
    d3.select("tbody").html("")
    d3.event.preventDefault();
    var inputElement = d3.select("#user-input");
    var inputValue = inputElement.property("value").toLowerCase().trim();

    // console.log(inputValue.length);
    // console.log(dictionary);

    var filteredData = dictionary.filter(dictionary => dictionary.English.toLowerCase().trim().includes(inputValue));
    // console.log(filteredData.length)

    output = filteredData

    for (var i = 0; i < filteredData.length; i++) {
      // console.log(output[i]['Neo-Khuzdul'])
      // console.log(output[i]['English'])
      // d3.select("tbody>tr>td").text(output[i]['Neo-Khuzdul']);
      d3.select("tbody").insert("tr").html("<td>"+(output[i]['Neo-Khuzdul'])+"</td><td>"+(output[i]['English'])+"</td>") }
  };
  window.resizeTo(screen.width,screen.height)


});
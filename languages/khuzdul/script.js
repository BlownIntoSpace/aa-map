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

    var filteredData = []

    if (!languageMode) {
      filteredData = dictionary.filter(dictionary => dictionary["English"].toLowerCase().trim().includes(inputValue));
    } else {
      filteredData = dictionary.filter(dictionary => dictionary["Neo-Khuzdul"].toLowerCase().trim().includes(inputValue));
    }


    // console.log(filteredData.length)

    output = filteredData
    var english_table = "English"

    if (complexMode) {
      english_table = "Complex"
    }

    for (var i = 0; i < filteredData.length; i++) {
      // console.log(output[i]['Neo-Khuzdul'])
      // console.log(output[i]['English'])
      // d3.select("tbody>tr>td").text(output[i]['Neo-Khuzdul']);
      d3.select("tbody").insert("tr").html("<td><a href='https://www.tecendil.com/?q=" + (output[i]['Neo-Khuzdul'])+"&mode=erebor'  class='contrast'>"+(output[i]['Neo-Khuzdul'])+"</a></td><td>"+(output[i][english_table])+"</td>") }
  };
  window.resizeTo(screen.width,screen.height)
});

let complexMode = false;
let languageMode = false;

document.addEventListener('DOMContentLoaded', function() {
  var toggleComplex = document.getElementById('complex');
  var toggleLanguage = document.getElementById('language');

  toggleComplex.addEventListener('click', function() {
    complexMode = !complexMode;
    console.log(complexMode);
    this.classList.toggle('active');
  });

  toggleLanguage.addEventListener('click', function() {
    languageMode = !languageMode;
    console.log(languageMode);
    this.classList.toggle('active');
    if (!languageMode) {
      document.getElementById("langDisplay").innerHTML = "English"
    } else {
      document.getElementById("langDisplay").innerHTML = "Khuzdul"
    }
  });

});
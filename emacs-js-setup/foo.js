
function render(pIndex, pParent) {
  let paragraph = document.createElement("p");
  paragraph.textContent += pIndex;
  pParent.appendChild(paragraph);
}

function main() {
  let name = "Lisa";
  console.log("hello " + name);

  let body = document.getElementsByTagName("body")[0];
  let h1 = document.createElement("h1");
  h1.textContent += "Hello " + name;
  body.appendChild(h1);
  [1, 2, 3, 4, 5].forEach(function (i) {
    render(i, body);
  });

  const foo = "hello";
}

main();

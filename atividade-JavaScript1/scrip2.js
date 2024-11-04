
const titulo = document.getElementById('titulo');
const link = document.querySelector('a');
const listaNaoOrdenada = document.querySelector('ul');
const listaOrdenada = document.getElementById('lista-ordenada');


titulo.innerText = "Bem-vindo ao Meu Projeto!";


link.innerText = "Acesse a Prozeducacao";
  

listaNaoOrdenada.innerHTML = `
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
`;


listaOrdenada.innerHTML = `
    <li><a href="https://www.google.com" target="_blank">Google</a></li>
    <li><a href="https://www.bing.com" target="_blank">Bing</a></li>
    <li><a href="https://www.yahoo.com" target="_blank">Yahoo</a></li>
`;


const titulo = document.createElement('h1'); 
titulo.id = 'titulo'; 
titulo.innerText = 'Bem-vindo à Nossa Loja Virtual!'; 
document.body.appendChild(titulo); 


const produtoContainer = document.createElement('div'); 
produtoContainer.className = 'produto'; 


const nomeProduto = document.createElement('h2');
nomeProduto.innerText = 'Produto Exemplo';


const descricaoProduto = document.createElement('p');
descricaoProduto.innerText = 'Esta é uma descrição detalhada do produto. Ele é feito de materiais de alta qualidade e atende a todas as suas necessidades.';


const precoProduto = document.createElement('p');
precoProduto.innerText = 'Preço: R$ 99,99';


const imagemProduto = document.createElement('img');
imagemProduto.src = 'https://via.placeholder.com/150';
imagemProduto.alt = 'Imagem do Produto';


produtoContainer.appendChild(nomeProduto);
produtoContainer.appendChild(descricaoProduto);
produtoContainer.appendChild(precoProduto);
produtoContainer.appendChild(imagemProduto);


document.body.appendChild(produtoContainer);


var imagesDiv = document.getElementById("card");

const getData = async () => {
  let data = null;
  console.log(window.location.toString().includes("account"));

  //window.location = window.location+"?"+localStorage.getItem("username");

/*
  var toServer = myJSONObject.toJSONString();
  var request=new XMLHttpRequest();
  var stringParameter = localStorage.getItem("username");
  request.open("POST", window.location+"?"+stringParameter, true);
  request.send(toServer);*/

  if(window.location.toString().includes("account")){
    data = await fetch("personalListFiles").then(response => response.json());
    Element.setAttribute("email",localStorage.getItem(username));
  }else{
    data = await fetch("generalListFiles").then(response => response.json());
  }

  data.forEach(data => {
    // const {id,extension,title,author,price,likes,email_owner} = data;
    const {id,extension,title,author,price,likes,email_owner} = data;
    let urlImage = "./"+id;

    imagesDiv.innerHTML += `
    <div class="col-md-4"> 
        <div class="card mb-4 shadow-sm">
          <div class="imgBx">
            <img class="bd-placeholder-img card-img-top" width="100%" height="100%"
                 src="${id}"
                 preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="#55595c"/>
            </img>
          </div>
          <div class="content">
            <div class="card-body">
              <h3 class="card-text">Titulo: ${title}</h3>
              <p class="card-text">Autor: ${author}</p>
              <p class="text-muted">Precio: ${price}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group btns">
                  <button type="button" class="btn btn-sm btn-outline-secondary">Comprar</button>      
                  <button type="button" class="btn btn-sm btn-outline-secondary">Añadir al carro</button>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  `;});};

window.addEventListener("DOMContentLoaded", getData());

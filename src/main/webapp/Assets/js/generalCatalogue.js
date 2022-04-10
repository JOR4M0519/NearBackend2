
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
  }else{
    data = await fetch("generalListFiles").then(response => response.json());
  }

  data.forEach(data => {
    // const {id,extension,title,author,price,likes,email_owner} = data;
    const {id,extension,title,author,price,likes,email_owner} = data;
    let urlImage = "./"+id;

    imagesDiv.innerHTML += `
    <div class="col-md-4"> 
        <div className="card mb-4 shadow-sm">
          <div className="imgBx">
            <img className="bd-placeholder-img card-img-top" width="100%" height="100%"
                 src="${id}"
                 preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="#55595c"/>
            </img>
          </div>
          <div className="content">
            <div className="card-body">
              <h3 className="card-text">Titulo: ${title}</h3>
              <p className="card-text">Autor: ${author}</p>
              <p className="text-muted">Precio: ${price}</p>
              <div className="d-flex justify-content-between align-items-center">
                <div className="btn-group btns">
                  <button type="button" className="btn btn-sm btn-outline-secondary">Comprar</button>      
                  <button type="button" className="btn btn-sm btn-outline-secondary">Añadir al carro</button>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  `;});};

window.addEventListener("DOMContentLoaded", getData());

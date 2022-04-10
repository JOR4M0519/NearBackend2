const url = getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","");
let campo = document.querySelector(".contenedor-social");

async function contar(id, currentLikes) {
  console.log("entra");
  var likes = currentLikes + 1;
  let resp = await fetch(`${url}/${id}`, {
    method: "PATCH",
    body: JSON.stringify({
      likes,
    }),
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
  });

  let data = resp.json();
  console.log(data);
  location.reload();
}

const getData = async () => {

  const resp = await fetch(url);
  const data = await resp.json();
  console.log(data);
  data.forEach((card) => {
    const { id, name, photo, colection, price, likes, nickname } = card;
    const { id,extension,title,author,price,email_owner } = card;
    campo.innerHTML += ` 
    <div class="card">
    <img src="${photo}" class="card-img-top"
        alt="...">
    <div class="card-body">
        <h5 class="card-title">${price} </h5>
        <p class="card-text">${title} &#8226; ${colection} </p>
        <p>${nickname}</p>
        <p>${likes} likes</p>
        <button onclick="contar(${id}, ${likes})" type="button" class="btn btn-outline-ligth-grey btn1" id="btnlikes"><span class="fa fa-heart"></span></button>
    </div>
</div>
        `;
  });
};

window.addEventListener("DOMContentLoaded", getData());

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Near</title>
    <link rel="shortcut icon" href="Assets/img/logo.ico" />
      <!-- BOOTSTRAP CSS -->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
            integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="Assets/Styles/main.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
<%
    String username = request.getParameter("usernameData");
    String name = String.valueOf(request.getAttribute("name"));
    String lastname = String.valueOf(request.getAttribute("lastname"));
    String role = String.valueOf(request.getAttribute("role"));
    String FCoins = String.valueOf(request.getAttribute("FCoins"));

%>


  <div class="sidebar">
    <div class="logo-details">
        <a href="index.jsp"><img class="logo icon" src="Assets\img\logoNear3.png"></a>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
      <li>
          <i class='bx bx-search' ></i>
         <input type="text" placeholder="Buscar...">
         <span class="tooltip">Buscar</span>
      </li>
      <li>
       <a href="#">
         <i class='bx bx-user' ></i>
         <span class="links_name">Cuenta</span>
       </a>
       <span class="tooltip">Cuenta</span>
     </li>
     <li>
       <a href="#">
        <i class='bx bx-coin'></i>
         <span class="links_name">FCoins</span>
       </a>
       <span class="tooltip">FCoins</span>
     </li>
     <li>
       <span class="tooltip">Files</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-cart-alt' ></i>
         <span class="links_name">Compras</span>
       </a>
       <span class="tooltip">Compras</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-heart' ></i>
         <span class="links_name">Favoritos</span>
       </a>
       <span class="tooltip">Favoritos</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Configuraciones</span>
       </a>
       <span class="tooltip">Configuraciones</span>
     </li>
     <li class="profile">
         <div class="profile-details">
           <!--<img src="profile.jpg" alt="profileImg">-->
           <div class="name_job">
             <div class="name"><%=name+" "+lastname%></div>
             <div class="job"><%=role%></div>
           </div>
         </div>
         <i class='bx bx-log-out' id="log_out" ></i>
     </li>
    </ul>
  </div>

<section class="home-section">
  <section class="contenedor" id="Cuenta">

    <h1 class="text">Tu cuenta</h1>
    <div class="info">
     
      <section>
        <figure>
          <img id="icon" src="Assets\img\avatar_driver_people_person_profile_user_icon_123374.png">
         </figure>
        <div id="text-icono"><%=name+" "+lastname%></div>
      </section>
      
      <section id="informacion-personal">
        
        <div id="Derecho">

         <div class="titulos-info">Nombre</div>
         <div class="conten-info"><%=name%></div>

         <div class="titulos-info" >Correo</div>
         <div class="conten-info" id="email"><%=username%></div>

        </div>

        <div id="izquierdo">
          
         <div class="titulos-info" >Apellido</div>
         <div class="conten-info" style="margin-bottom: 8.7%;"><%=lastname%></div>
        
         <div class="titulos-info" >Rol</div>
         <div class="conten-info"><%=role%></div>
      
        </div>
        
      </section>

    </div>

  </section>

  <section class="contenedor" id="FCoins">

    <h1 class="text">Dashboard</h1>
    <div class="info">Resto</div>

  </section>

  <section class="contenedor" id="Compras">

    <h1 class="text">Dashboard</h1>
    <div class="info">Resto</div>

      <section class="py-5" >
          <div class="cards">
              <p id="ofertas" class="card_tittle">Catálogo:</p>
              <!--Guia js-->
              <div class="card-group contenedor-social" id="socialcard">
                  <section class="py-5">

                      <div class="album py-5 bg-light">
                          <div class="container">

                              <div class="row" id="card">
                                  <div class="col-md-4">

                                      <div class="card mb-4 shadow-sm">
                                          <div class="imgBx">
                                              <img class="bd-placeholder-img card-img-top" width="100%" height="100%" src="https://www.arweave.net/yoNSEKfSCGY23L14Y_P06G42r79G7cl4HYFeM5kjXdo?ext=png" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></img>
                                          </div>
                                          <div class="content">
                                              <div class="card-body">
                                                  <h3 class="card-text">Nombre NFT</h3>
                                                  <p class="card-text">Autor NFT</p>
                                                  <p class="text-muted">Precio NFT</p>
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
                                  <div class="col-md-4">
                                      <div class="card mb-4 shadow-sm">
                                          <div class="imgBx">
                                              <img class="bd-placeholder-img card-img-top" width="100%" height="100%" src="https://www.arweave.net/yoNSEKfSCGY23L14Y_P06G42r79G7cl4HYFeM5kjXdo?ext=png" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></img>
                                          </div>
                                          <div class="content">
                                              <div class="card-body">
                                                  <h3 class="card-text">Nombre NFT</h3>
                                                  <p class="card-text">Autor NFT</p>
                                                  <p class="text-muted">Precio NFT</p>
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
                              </div>
                          </div>
                      </div>
                  </section>
              </div>
          </div>
      </section>
  </section>

  <section class="contenedor" id="Favoritos">

    <h1 class="text">Dashboard</h1>
    <div class="info">Resto</div>

  </section>

  <section class="contenedor" id="Configuraciones">

    <h1 class="text">Dashboard</h1>
    <div class="info">Resto</div>
    
  </section>
</section>

<script src="Assets/js/generalCatalogue.js"></script>
<script src="Assets/js/account.js"></script>
</body>
</html>

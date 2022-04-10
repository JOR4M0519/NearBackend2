<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Near</title>
    <link rel="shortcut icon" href="Assets/img/logo.ico" />
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
        <a href="index.html"><img class="logo icon" src="Assets\img\logoNear3.png"></a>
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
         <div class="conten-info"><%=username%></div>

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

<script src="Assets/js/account.js"></script>
</body>
</html>

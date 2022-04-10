<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Near</title>
    <link rel="shortcut icon" href="Assets/img/logo.ico" />
      <!-- BOOTSTRAP CSS -->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
      <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Abel&display=swap" rel="stylesheet">
    <!-- CUSTOM CSS -->
    <link rel="stylesheet" href="Assets/Styles/main.css">
</head>
<body>


<div style="float: inline-start;">
    <div style="float: right; position: fixed">
    <img src="Assets\img\FondoLogin.png" style="margin-left: 30%;" width="90%">
    </div>

    <div class="contenedor-login">
    <a href="index.jsp"><img src="Assets\img\LogoLogin.png" width="35%"></a>
        
    <div class="contenedor-form-login">  
        <h1 style="margin-bottom: 15%; text-align: center; font-size: 270%;">Inicia Sesión</h1>
        <form action="./login" method="post">
          
        <div class="form-group" >
          <span for="name" >Correo:</span>
          <input type="email" class="form-control" id="username" name="username" required>
        </div>  
          
        <div class="form-group">
          <span for="name" >Contraseña:</span>
          <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="form-group" >
            <label for="roleInput">Rol</label>
            <select name = "role" class="form-control" id="roleInput" aria-describedby="role" required>
              <option>Artista</option>
              <option>Comprador</option>
            </select>
          </div>
  
        <button type="submit" class="btn btn-primary; btn-box-sign-up" style="margin-left: 35%;" >Ingresar</button>
      </form>
    </div>
</div>
</div>

</body>
</html>
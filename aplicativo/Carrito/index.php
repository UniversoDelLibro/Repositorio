<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Tienda</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
    <?php include("./layouts/header.php"); ?> 

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Productos</h2></div>
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Categorias
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item" href="#">Terror</a>
                      <a class="dropdown-item" href="#">Ciencia Ficcion</a>
                      <a class="dropdown-item" href="#">Drama Policial</a>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            <div class="row mb-5">
              <?php 
                include("./php/conexion.php");
                 /* for($i=0;$i<25;$i++){
                  $conexion->query("insert into productos (nombre, descripcion, precio, imagen, inventario, id_categoria) values(
                    'Producto $i','Esta es la descripcion',".rand(10,1000).", 'libro1.jpg', ".rand(1,100).",1
                  ) ")or die($conexion->error);
                } */
                $limite = 10; //productos por pagina
                $totalQuery = $conexion->query('select count(*) from productos')or die($conexion->error);
                $totalProductos = mysqli_fetch_row($totalQuery); 
                $totalBotones = round($totalProductos[0] /$limite);  
                if(isset($_GET['limite'])){
                  $resultado = $conexion ->query("select * from productos where inventario> 0 order by id DESC limit ".$_GET['limite'].",".$limite)or die ($conexion -> error); 
                }else{
                  $resultado = $conexion ->query("select * from productos where inventario> 0 order by id DESC limit ".$limite)or die ($conexion -> error);
                }
            
                
                while($fila = mysqli_fetch_array($resultado)){
                
              ?> 
                <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                  <div class="block-4 text-center border">
                    <figure class="block-4-image">
                      <a href="shop-single.php?id=<?php echo $fila['id']; ?>">
                        <img src="images/<?php echo $fila['imagen']; ?>" alt="<?php echo $fila['nombre']; ?>" class="img-fluid"></a>
                    </figure>
                    <div class="block-4-text p-4">
                      <h3><a href="shop-single.php?id=<?php echo $fila['id']; ?>"><?php echo $fila['nombre']; ?></a></h3>
                      <p class="mb-0"><?php echo $fila['descripcion']; ?></p>
                      <p class="text-primary font-weight-bold">$<?php echo $fila['precio']; ?></p>
                    </div>
                  </div>
                </div>  
               <?php } ?>
            


            </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    
                    <?php 
                    if(isset($_GET['limite'])){
                      if($_GET['limite']>0){
                         echo ' <li><a href="index.php?limite='.($_GET['limite']-10).'">&lt;</a></li>';
                      }
                    }

                      for($k=0;$k<$totalBotones;$k++){
                        echo '<li><a href="index.php?limite='.($k*10).'">'.($k+1).'</a></li>';
                      }
                      if(isset($_GET['limite'])){
                        if($_GET['limite']+10 < $totalBotones*10){
                          echo '<li><a href="index.php?limite='.($_GET['limite']+10).'">&gt;</a></li>';
                        }
                      }else{
                        echo '<li><a href="index.php?limite=10">&gt;</a></li>';
                      }
                    ?>
                    
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categorias</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="#" class="d-flex"><span>Terror</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Ciencia Ficcion</span> </a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Drama Policial</span> </a></li>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filtrar por precio</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
              </div>

            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2>Categorias</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="images/terror.jpg" alt="" class="img-fluid"  width= "400px;" heigh= "350px;">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Genero</span>
                        <h3>Terror</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="images/cienf.jpg" alt="" class="img-fluid"  width= "400px;" heigh= "350px;">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Genero</span>
                        <h3>Ciencia Ficcion</h3>
                      </div>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="#">
                      <figure class="image">
                        <img src="images/poli.jpg" alt="" class="img-fluid"  width= "500px;" heigh= "550px;">
                      </figure>
                      <div class="text">
                        <span class="text-uppercase">Genero</span>
                        <h3>Drama Policial</h3>
                      </div>
                    </a>
                  </div>
                </div>
              
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <?php include("./layouts/footer.php"); ?> 

    
  </div>

  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/jquery-ui.js"></script>
  <script src="./js/popper.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script src="./js/owl.carousel.min.js"></script>
  <script src="./js/jquery.magnific-popup.min.js"></script>
  <script src="./js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>
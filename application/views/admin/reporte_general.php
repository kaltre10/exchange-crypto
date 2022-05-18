<?= $header; ?>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

  <?= $nav; ?>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
            <!-- Nav Item - Alerts -->
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= $this->session->nombre_usuario; ?></span>
              </a>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"><i class="far fa-file-alt"></i> Reporte General</h1>
          </div>
        
            <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="d-flex justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary"></h6>
                <form action="" method="POST">
                  <div class="form-row align-items-center">
                    <div class="col-auto">
                      <label class="sr-only">Fecha</label>
                      <input type="date" class="form-control mb-2" value="<?php if($this->input->post('desde')){ echo $this->input->post('desde'); }else{ echo date("Y-m-d"); } ?>" name="desde">
                    </div>
                   <!--  <div class="col-auto">
                      <label class="sr-only">Hasta</label>
                      <div class="input-group mb-2">
                        <input type="date" class="form-control" value="<?php if($this->input->post('hasta')){ echo $this->input->post('hasta'); }else{ echo date("Y-m-d"); } ?>" name="hasta">
                      </div>
                    </div> -->
                    <div class="col-auto">
                      <button type="submit" class="btn btn-primary mb-2"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </div>
                  </div>
                </form>      
              </div>
            </div>
            <div class="card-body">     
              <div class="table-responsive">
                <table class="table table-sm table-hover" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Codigo</th>
                      <th>Moneda</th>
                      <th>Cantidad</th>
                      <th>Cotización</th>
                      <th>Valor (PEN)</th>
                    </tr>
                  </thead>
                  <tbody>  
              <?php 
                $suma = 0;
                $suma_gastos_compra = 0; 
              ?>   
              <?php foreach ($divisas as $key) : ?>
              <?php if ($key['caja'] == 0) {
                continue;
              } ?>
                    <tr>
                      <td><img style="width: 30px; height: 15px;" src="<?= base_url('assets/img/' . $key['codigo'] .'.png'); ?>"> <?= $key['codigo']; ?> </td>
                      <td><?= $key['nombre']; ?></td>
                      <td><?= number_format($key['caja'], 2); ?></td>
                      <?php 
                        //verificamos el promedio para la cotizacion del dia
                        $cotizacion = 0;
                        foreach ($registro_cotizacion as $arr){
                         
                          if ( $arr['compras'] == 0 && $arr['ventas'] == 0 ){
                          continue;
                          } 
                          if($arr['codigo'] == $key["codigo"]){
                            $suma_gastos_compra = $suma_gastos_compra + $arr['gastos_compra'];
                            if($arr['gastos_compra']){
                              $cotizacion = number_format(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
                            } 
                          }
                        }

                        //si la divisa es soles igualamos a 1 la cotizacion
                        if($key['codigo'] === 'PEN'){
                          $cotizacion = 1;
                        }
         
                        $suma_gastos_compra = $suma_gastos_compra + $key['gastos_compra']; 
                        if($key['gastos_compra']){
                          echo number_format(round($key['gastos_compra'] / $key['compras'] , 4), 4);
                        }  

                        //si la cotizacion es 0 o no se ha registrado compras de la divisa 
                        //se iguala la cotizacion al tipo de cambio para calcular el valor en soles
                        if($cotizacion == 0){
                          $cotizacion = $key['cotizacion'];
                        }

                      ?>
                      <td><?= $cotizacion; ?></td>
                      <td><?= number_format($acum = round($key['caja'] * $cotizacion, 2), 2); ?></td>
                    </tr>
              <?php $suma = $suma + $acum; ?>
              <?php endforeach; ?>
                    <tr>
                      <td colspan="4" class=" text-center font-weight-bold">Total</td>
                      <td class="font-weight-bold"><?= number_format($suma, 2); ?></td>
                    </tr>
                  </tbody>
                </table>
              </div>  
              
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
<?= $footer; ?>
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
                $porcentaje_compra_anterior = 0;
                $porcentaje_compra = 0;
                $peso_anterior = 0; //peso del valor porcentual
                $peso = 0; //peso del valor porcentual
                $index = 0;
               
                $cotizacion = 0;
                $cot = 0;
              ?>   
              <?php foreach ($divisas as $key) : ?>
              <?php if ($key['caja'] == 0) {
             
                continue;
                
              } ?>
                    <tr>
                      <td><img style="width: 30px; height: 15px;" src="<?= base_url('assets/img/' . $key['codigo'] .'.png'); ?>"> <?= $key['codigo']; ?> </td>
                      <td><?= $key['nombre']; ?></td>
                      <td><?= str_pad($key['caja'], 4); ?></td>
                      <?php
                      //asignamos primero la cotizacion registrada en el sistema
				              $cot = $key['cotizacion'];
                    
                      foreach ($cierres as $cie){
          
                        foreach($cie as $c){
                         
                          if($c->cod_divisa_cierre === $key['codigo'] ){
                          
                           
                            foreach ($registro_cotizacion as $arr){
                              
                              //asignamos la cotizacion del cierre anterior si es la misma divisa 
                              if($arr['codigo'] == $cie[$index]->cod_divisa_cierre){ 
                               
                                foreach ($cie as $c){ 
                                 
                                  if($c->cod_divisa_cierre == $arr['codigo']){
                                    $cot = $c->cot_cierre;
                                  
                                  }
                                }
  
                              }
                             
                                if ( $arr['compras'] == 0){
                                continue;
                                } 
                              
                                if($arr['codigo'] == $key["codigo"]){
                                
                                  //formula calcular cotizacion
                                  //cantidad_cierre_anterior * 100 / cantidad _total;
                                  $porcentaje_compra_anterior = ($cie[$index]->can_cierre * 100) / ($key['caja'] + $arr['ventas']);
                                  $peso_anterior = $porcentaje_compra_anterior * $cie[$index]->cot_cierre;
                                 
                                  $cotizacion = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
                                  $porcentaje_compra = ($arr['compras'] * 100) / ($key['caja'] + $arr['ventas']);
                                  $peso = $cotizacion * $porcentaje_compra;
                                  
                                  $cot =  ($peso_anterior + $peso) / 100;
                              
                                }
                                
                             
                               
                              }
                                 
                             
                          }
                        }
       
                      
                        //si no hay compras en el dia y la cotizacion es 0 se iguala al cierre anterior
                        $last_date_cierre = $cierres[0][0]->fec_cierre;
                        foreach($cie as $c){
                          foreach($registro_cotizacion as $reg){                        
                            if($reg['codigo'] == $key["codigo"] && $c->cod_divisa_cierre == $key["codigo"] && $c->fec_cierre == $last_date_cierre && $reg['compras'] == 0){   
                              $cot = $c->cot_cierre;
                            }
                          }
                        }
                        

                        //verificamos si ya se hizo el cierre del dia
                           
                        if($cie[$index]->fec_cierre == date('Y-m-d')){       
                          foreach ($cie as $c){  
                            
                            if($c->cod_divisa_cierre == $key["codigo"]){
                            
                              $cot = $c->cot_cierre;
                            }
                          }
                        }
                        
                        $index++;
                      }
                
                  
                        //si la divisa es soles igualamos a 1 la cotizacion
                        if($key['codigo'] === 'PEN'){
                          $cot = 1;
                        } 
              
                       //si no hay cierre anterior(primer dia)
                      if($cierres === 0){
                        
                        foreach ($registro_cotizacion as $arr){
                          if ( $arr['compras'] == 0){
                            continue;
                          } 
                         
                          if($arr['codigo'] == $key["codigo"] && $key["cotizacion"] > 0){
                            $cot = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);
                          }
                        }
                      }
                    
                      
               
                       //si no hay cierre anterior de la divisa comprada
                       if($key['caja'] > 0 && is_array($cierres)){
                        
                        $index2 = 0;
                        $suma_gastos_venta = 0;
                        foreach ($registro_cotizacion as $arr){
                          if ( $arr['compras'] == 0){
                            continue;
                          } 
                        
                          $array_cierres = array_column($cierres[0], 'cod_divisa_cierre');
                         
                          foreach($cierres as $cie){
                            if($arr['codigo'] == $key["codigo"] && !in_array($arr['codigo'], $array_cierres)){
                              
                              $cot = str_pad(round($arr['gastos_compra'] / $arr['compras'] , 4), 4);        
                            }
                          }
                        }
                      }
                      
                      //si existe post y se consulta el reporte de fecha anterior 
                      if($this->input->post('desde') && $this->input->post('desde') !== date('Y-m-d')){
                        $cot = $key["cotizacion"];
                      }
                      
                      ?>
                      <td><?= str_pad(round($cot, 4), 4); ?></td>
                      <td><?= str_pad($acum = round($key['caja'] * $cot, 4), 4); ?></td>
                    </tr>
              <?php $suma = $suma + $acum; ?>
              <?php endforeach; ?>
                    <tr>
                      <td colspan="4" class=" text-center font-weight-bold">Total</td>
                      <td class="font-weight-bold"><?= str_pad($suma, 4,); ?></td>
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
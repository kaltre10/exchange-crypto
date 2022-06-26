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
            <h1 class="h3 mb-0 text-gray-800"><i class="far fa-file-alt"></i> Utilidad</h1>
          </div>
        
            <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="d-flex justify-content-between">
                <form action="" method="POST">
                  <div class="form-row align-items-center">
                    <div class="col-auto">
                      <label class="sr-only">Desde</label>
                      <input type="date" class="form-control mb-2" value="<?php if($this->input->post('desde')){ echo $this->input->post('desde'); }else{ echo date("Y-m-d"); } ?>" name="desde">
                    </div>
                    <div class="col-auto">
                      <label class="sr-only">Hasta</label>
                      <div class="input-group mb-2">
                        <input type="date" class="form-control" value="<?php if($this->input->post('hasta')){ echo $this->input->post('hasta'); }else{ echo date("Y-m-d"); } ?>" name="hasta">
                      </div>
                    </div>
                    <div class="col-auto">
                      <button type="submit" class="btn btn-primary mb-2"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </div>
                  </div>
                </form>      
              </div>
            </div>
            
            <div class="card-body">    

            <div class="row">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Ganancias</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><span class="text-success">S/. <?= str_pad(round($ganancia, 4) , 4); ?></span></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-money-bill-wave fa-2x  text-gray-300" aria-hidden="true"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Gastos</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><span class="text-danger">S/. -<?= $gastos; ?></span></div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>  

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">S/.<span class="<?php if(($ganancia - $gastos) > 0) { echo "text-success";}else{ echo "text-danger";} ?>"><?= $ganancia - $gastos; ?></span></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            </div>    
              <!-- <?php foreach ($operaciones as $key) : ?>
              <div class="table-responsive">
                <table class="table table-sm text-center table-hover" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Tipo</th>
                      <th>Cantidad</th>
                      <th>Fecha</th>
                      <th>Cotizacion</th>
                      <th>Recibe</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr <?php echo ($key->status == 0) ? "class='text-danger font-weight-lighter' style='style=opacity: 0.8;'" : ""; ?>>
                      <td><?= $key->tip_operacion; ?></td>
                      <td><img style="width: 30px; height: 15px;" src="<?= base_url('assets/img/' . $key->div_operacion .'.png'); ?>"> <?= str_pad($key->mon_operacion, 4) . " " . $key->div_operacion; ?></td>
                      <td><?= $key->fec_operacion; ?></td>
                      <td><?= $key->cot_operacion; ?></td>
                      <td><img style="width: 30px; height: 15px;" src="<?= base_url('assets/img/' . $key->mon_rec_operacion .'.png'); ?>"> <?= str_pad($key->rec_operacion, 4) . " " . $key->mon_rec_operacion; ?></td>
                      <td rowspan="2" style="
    vertical-align: inherit;
"></td>
                        <td rowspan="2" style="vertical-align: inherit; cursor: pointer"><button class="btn" style="color: tomato;" type="button"
                 
                        onclick="report('<?= $key->id_operacion; ?>');" title="No reportado a sunat, Reportar Ahora"><i class="fa fa-exclamation-triangle fa-2x"></i></button></td>

                   
                        <td rowspan="2" style="vertical-align: inherit; color: #27ae60; cursor: pointer" onclick="pdf('<?= $key->id_operacion; ?>');" title="Descargar PDF"><i class="fa fa-file fa-2x" aria-hidden="true"></i></td>

                        <td rowspan="2" style="vertical-align: inherit; color: #27ae60;" title="Reportado Correctamente"><i class="fa fa-check-square fa-2x" aria-hidden="true"></i></td>
                       

                    </tr>
                    <tr <?php echo ($key->status == 0) ? "class='text-danger font-weight-lighter'" : ""; ?>>
                      <td>N° Operacion: #<?= $key->id_operacion; ?></td>
                      <td colspan="1">Correlativo: <?= $key->correlative_sunat; ?></td>
                      <td colspan="2">Usuario: <?= $key->nom_usuario; ?></td>
                      <td colspan="2">Cliente: <?= $key->nom_cliente; ?><br>
                        <?php if ($key->nom_cliente != "REGULAR"): ?>
                        <?= "<b>" . $key->doc_cliente . "</b>: $key->n_cliente"; ?>
                        <?php endif;?>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div><hr>
              <?php endforeach; ?> -->
                  
              
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
      <script>

         function report(id){
            fetch('Operaciones/check_operacion_id', {
              method: 'POST',
              headers: {
              'Content-Type': 'application/json',
              },
              body: JSON.stringify(Number(id))
            })
            .then(res => res.json())
            .then(res => {
              swal({
                  title: "Repotar Ahora?",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
              })
              .then((aceptado) => {
                    //VERIFICANDO LOS DATOS ENVIADOS
                    if (aceptado){     
                      swal("Guardando y Reportando...!", {
                        icon: "info",   
                        buttons: false, 
                      })
                      
                      let data = formatJSON(res);
                      data.correlativo = res.correlative_sunat; //add correlativo
                      
                      getToken(res)
                          .then(respuesta => {
                            if(respuesta.sunatResponse.success){

                              //actualizar report de la operacion
                              fetch('Operaciones/update_operacion', {
                                  method: 'POST',
                                  headers: {
                                  'Content-Type': 'application/json',
                                  },
                                body: JSON.stringify(Number(data.id_operacion))
                              })

                              swal("Reportado correctamente a la Sunat!", {
                                icon: "success",   
                                buttons: {
                                  defeat: "ok",
                                }, 
                              })
                              .then((value) => {
                                switch (value) {
                                  default:
                                  location.reload()
                                  //form.submit();
                                }
                              });

                            }else{
                              swal({
                                title: "Ha ocurrido un problema con sunat!",
                                text: "Verifique su conexion a internet o intente más tarde!",
                                icon: "warning",   
                                buttons: {
                                  defeat: "ok",
                                }, 
                              })
                            }
                          })
                          .catch(err =>{
                            swal({
                                title: "Ha ocurrido un problema con sunat!",
                                text: "Verifique su conexion a internet o intente más tarde!",
                                icon: "warning",   
                                buttons: {
                                  defeat: "ok",
                                }, 
                              })
                          })
                    }
                  });

            })
         }

         function anular(id, fecha){
                swal({
                  title: "Seguro desea Anular?",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((aceptado) => {
                  //VERIFICANDO LOS DATOS ENVIADOS
                  if (aceptado){
                    swal("Reportando Baja de Boleta...!", {
                          icon: "info",   
                          buttons: false, 
                        })
                    sendBaja(id, fecha)
                      .then(res => res.json())   
                      .then(res => {
                        if(res.sunatResponse.success){
                           swal("Anulado con exito!", {
                              icon: "success",   
                              buttons: {
                                defeat: "ok",
                              }, 
                            })
                            .then((value) => {
                              switch (value) {
                                default:
                                location.href="Reporte_detallado/anular/" + id;
                                //form.submit();
                              }

                            });
                        }
                      }) 
                      .catch(err => {
                        swal({
                            title: "Error al reportar Baja!",
                            text: "se ha producido un error al reportar la baja de la boleta por favor verifique su internet o intente más tarde...!",
                            icon: "warning",   
                            buttons: {
                              defeat: "ok",
                            }, 
                          })
                      })  
                  
                  }
            });
        }

        function formatJSON(data){
          //ajustamos los datos para el JSON antes
          // de enviarlo y reportar a sunat
          data.clienteID = data.cli_operacion;
          data.cotizacion = data.cot_operacion;
          data.moneda = data.div_operacion;
          data.moneda_recibe = data.mon_rec_operacion;
          data.monto = data.mon_operacion;
          data.recibe = data.rec_operacion;
          return data;
        }

        function pdf(id) {
          swal({
                  title: "Descargar PDF?",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
              })
              .then( async (aceptado) => {
                if(aceptado){
                  const query = await fetch('Operaciones/check_operacion_id', {
                                            method: 'POST',
                                            headers: {
                                            'Content-Type': 'application/json',
                                            },
                                            body: JSON.stringify(Number(id))
                                          })
                  const operation = await query.json();
                  const queryPDF = await configJsonPdf(operation);
                  const pdfResponse = await queryPDF.blob();
                  createPDF(pdfResponse);
                }
              })
        }

        const createPDF = (dataAPi) => {
          let objectURL = URL.createObjectURL(dataAPi);
          let link = document.createElement('a');
          document.body.appendChild(link); 
          link.href = objectURL;
          link.download = "Boleta";
          link.click();
          window.URL.revokeObjectURL(objectURL);
          link.remove();
        }  
      </script>
      <script src="<?= base_url("assets/js/numeroAletras.js"); ?>"></script>
      <script src="<?= base_url("assets/js/boleta-electronica.js"); ?>"></script>
<?= $footer; ?>
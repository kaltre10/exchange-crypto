  <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?= base_url("admin/Admin_dashboard"); ?>">
        <div class="sidebar-brand-icon rotate-n-1">
				<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
width="50" height="50"
viewBox="0 0 172 172"
style=" fill:#000000;"><g transform=""><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><path d="" fill="none"></path><path d="" fill="none"></path><g fill="#ffffff"><path d="M86,6.88c-43.65603,0 -79.12,35.46397 -79.12,79.12c0,43.65603 35.46397,79.12 79.12,79.12c43.65603,0 79.12,-35.46397 79.12,-79.12c0,-43.65603 -35.46397,-79.12 -79.12,-79.12zM86,13.76c39.93779,0 72.24,32.30221 72.24,72.24c0,39.93779 -32.30221,72.24 -72.24,72.24c-39.93779,0 -72.24,-32.30221 -72.24,-72.24c0,-39.93779 32.30221,-72.24 72.24,-72.24zM72.24,34.4v10.32h-17.2v82.56h17.2v10.32h6.88v-10.32h6.88v10.32h6.88v-10.3536c7.90588,-0.22371 26.83469,-2.4396 26.83469,-23.36109c0,-14.448 -12.38937,-19.25997 -17.54937,-19.94797v-0.34266c2.408,-0.688 14.45203,-4.47334 14.45203,-18.57734c0,-17.59392 -16.66356,-19.91402 -23.73735,-20.22344v-10.3939h-6.88v10.32h-6.88v-10.32zM62.95469,51.25735h27.17063c12.384,0 18.57734,5.16 18.57734,15.48c0,2.064 -0.33997,3.78265 -1.02797,5.50265c-0.688,1.72 -2.064,3.09869 -3.44,4.47469c-1.72,1.376 -3.44403,2.40263 -5.85203,3.09063c-2.408,0.688 -5.16134,1.03469 -8.25734,1.03469h-27.17063zM62.95469,87.72h27.17063c6.88,0 12.38803,1.37331 16.17203,4.12531c3.784,2.752 5.50265,6.88 5.50265,12.04c0,3.44 -0.688,6.19334 -1.72,8.25734c-1.376,2.064 -2.75335,3.784 -4.81735,5.16c-2.064,1.376 -4.128,2.41069 -6.88,2.75469c-2.408,0.344 -5.16134,0.68531 -8.25734,0.68531h-27.17063z"></path></g></g></g></svg>
        </div>
        <div class="sidebar-brand-text mx-1"><sup>CRYPTOMONEDAS</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<?= base_url("admin/Admin_dashboard"); ?>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <li class="nav-item">
        <a class="nav-link" href="<?= base_url("admin/Divisas"); ?>">
          <i class="fas fa-coins"></i>
          <span>Divisas</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="<?= base_url("admin/Operaciones"); ?>">
          <i class="fas fa-exchange-alt"></i>
          <span>Operaciones</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="<?= base_url("admin/Clientes"); ?>">
          <i class="fas fa-users"></i>
          <span>Clientes</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="<?= base_url("admin/ent_sal"); ?>">
          <i class="fas fa-compress-arrows-alt"></i>
          <span>Salidas/Entradas</span></a>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="far fa-file-alt"></i>
          <span>Reportes</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="<?= base_url("admin/Reporte_general"); ?>">General</a>
            <a class="collapse-item" href="<?= base_url("admin/Reporte_detallado"); ?>">Detallado</a>
            <a class="collapse-item" href="<?= base_url("admin/Reporte_diario"); ?>">Diario</a>
            <a class="collapse-item" href="<?= base_url("admin/Utilidad"); ?>">Utilidad</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>
      <?php if($this->session->userdata('rango') == 0) { ?>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilitie" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fa fa-cog" aria-hidden="true"></i>
          <span>Configuración</span></a>
        <div id="collapseUtilitie" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="<?= base_url('admin/Cajas'); ?>"><i class="fa fa-window-restore" aria-hidden="true"></i> Cajas</a>
            <a class="collapse-item" href="<?= base_url('admin/Cuentas'); ?>"><i class="fa fa-cubes" aria-hidden="true"></i> Cuentas</a>
            <a class="collapse-item" href="<?= base_url('admin/Categorias'); ?>"><i class="fa fa-tag" aria-hidden="true"></i> Categorias</a>
            <a class="collapse-item" href="<?= base_url('admin/Usuarios'); ?>"><i class="fa fa-users" aria-hidden="true"></i> Usuarios</a>
            <a class="collapse-item" href="<?= base_url('admin/Boleta'); ?>"><i class="fa fa-list-alt" aria-hidden="true"></i> Boleta Electrónica</a>
            <span style="cursor: pointer;" class="collapse-item" href="" onclick="cerrar_dia();"><i class="fas fa-calendar-check"></i> Cierre del Dia</span>
            <span style="cursor: pointer; text-decoration: line-through;" class="collapse-item" href="" onclick="anular_cierre();"><i class="fas fa-calendar-times"></i> Anular Cierre</span>
          </div>
        </div>
      </li>
      <?php } ?>
      <li class="nav-item">
        <button class="nav-link" style="background: #2d54c6;border: 0 solid;" type="button" onclick="cerrar_session()">
          <i class="fas fa-door-open"></i>
          <span>Salir</span></button>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
    <script>
    function cerrar_dia(){
          swal({
            title: "Cerrar Dia?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((aceptado) => {
                  // //VERIFICANDO LOS DATOS ENVIADOS
                  if (aceptado){     
                    swal("Procesado con Exito!", {
                      icon: "success",   
                      buttons: {
                        defeat: "ok",
                      },
                    })
                    .then((value) => {
                      switch (value) {
                        default:
                          location.href="Cierre/save_cierre";
                          //form.submit();
                      }
                    });
                  }
            });
        }  
        function anular_cierre(){
          swal({
            title: "Anular Cierre?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((aceptado) => {
                  // //VERIFICANDO LOS DATOS ENVIADOS
                  if (aceptado){     
                    swal("Procesado con Exito!", {
                      icon: "success",   
                      buttons: {
                        defeat: "ok",
                      },
                    })
                    .then((value) => {
                      switch (value) {
                        default:
                          location.href="Cierre/anular_cierre";
                          //form.submit();
                      }
                    });
                  }
            });
        }  
  </script>

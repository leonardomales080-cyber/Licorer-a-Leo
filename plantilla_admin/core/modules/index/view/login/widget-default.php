  <div class="row">
      <div class="form-group col-sm-6">
          <p align="center">
              <img src="uploads/img/logo_itsi.png" align="center" width="275" height="160">
          </p>
          <center>Dirección Av. Atahualpa y Miguel Leoro</center>
          <center>Ibarra-Ecuador</center>
          <center>Teléfono: (06) 295-2535</center>

      </div>
      <div class="form-group col-sm-6">
          <div class="login-box">
              <div class="card card-outline card-primary">
                  <div class="card-header">
                      <h3>Acceso al sistema</h3>
                  </div>
                  <div class="card-body login-card-body">

                        <?php
                        if (isset($_SESSION['user_error']) && $_SESSION['user_error'] != null) {
                        ?>
                            <div class="alert alert-danger" role="alert">
                                <i class="bi bi-x-circle-fill me-2"></i> <strong>Error:</strong>
                                <?php echo $_SESSION['user_error']; ?>
                            </div>
                        <?php
                            $_SESSION['user_error'] = null;
                        }
                        ?>

                      <p class="login-box-msg">Sign in to start your session</p>

                      <form action="./?action=processlogin" method="post">
                          <div class="input-group mb-1">
                              <div class="form-floating">
                                  <input id="loginEmail" type="text" name="txtCedula" class="form-control" value="" placeholder="" />
                                  <label for="loginEmail">Usuario</label>
                              </div>
                              <div class="input-group-text">
                                  <span class="bi bi-envelope"></span>
                              </div>
                          </div>
                          <div class="input-group mb-1">
                              <div class="form-floating">
                                  <input id="loginPassword" type="password" name="txtPassword" class="form-control" placeholder="" />
                                  <label for="loginPassword">Password</label>
                              </div>
                              <div class="input-group-text">
                                  <span class="bi bi-lock-fill"></span>
                              </div>
                          </div>
                          <!--begin::Row-->
                          <div class="row">
                              <div class="col-8 d-inline-flex align-items-center">
                                  <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                      <label class="form-check-label" for="flexCheckDefault"> Remember Me </label>
                                  </div>
                              </div>
                              <!-- /.col -->
                              <div class="col-4">
                                  <div class="d-grid gap-2">
                                      <button type="submit" name="btn-login" class="btn btn-primary">Sign In</button>
                                  </div>
                              </div>
                              <!-- /.col -->
                          </div>
                          <!--end::Row-->
                      </form>

                      <div class="social-auth-links text-center mb-3 d-grid gap-2">
                          <p>- OR -</p>
                          <a href="#" class="btn btn-primary">
                              <i class="bi bi-facebook me-2"></i> Sign in using Facebook
                          </a>
                          <a href="#" class="btn btn-danger">
                              <i class="bi bi-google me-2"></i> Sign in using Google+
                          </a>
                      </div>
                      <!-- /.social-auth-links -->

                      <p class="mb-1">
                          <a href="forgot-password.html">I forgot my password</a>
                      </p>
                      <p class="mb-0">
                          <a href="register.html" class="text-center"> Register a new membership </a>
                      </p>
                  </div>
                  <!-- /.login-card-body -->
              </div>
          </div>
      </div>
  </div>
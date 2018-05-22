

<div class="container">
    <div class="row vertical-offset-75">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>Login</strong></h3>
			 	</div>

			  	<div class="panel-body">
			    	<form accept-charset="utf-8" role="form" class="form-horizontal" method="POST" action='{{urlfor "LoginController.Login"}}'>
                      {{ .xsrfdata }}

                      {{template "alert.tpl" .}}

                      <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9">
                          <input class="form-control" placeholder="example: admin@example.com" name="Email" value="{{index .Params "Email"}}" type="email" required
                                    id="inputEmail" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPassword" class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-9">
			    		  <input class="form-control" placeholder="password" name="Password" type="password" value="" required
                                    pattern=".{6,}" title="input password" id="inputPassword"  />
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-12">
			    		    <input class="btn btn-lg btn-success" type="submit" value="Submit">
                            <a href="{{urlfor "LoginController.PasswordReset"}}">
                                Reset Password
                            </a>
                        </div>
                      </div>
                    </form>
			    </div>

                <div class="panel-footer text-center clearfix">Not Registered Yet? <a href='{{urlfor "LoginController.Signup"}}'>SignUp »</a></div>

			</div>
		</div>
	</div>
</div>



<div class="container">
    <div class="row vertical-offset-50">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>Signup</strong></h3>
			 	</div>

			  	<div class="panel-body">
			    	<form accept-charset="utf-8" role="form" class="form-horizontal" method="POST" action='{{urlfor "LoginController.Signup"}}'>
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
                        <label for="inputParent" class="col-sm-3 control-label">Parent</label>
                        <div class="col-sm-9">
                          <input class="form-control" placeholder="Parent Name" name="Parent" type="text" required
                                    id="inputParent" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputStudent" class="col-sm-3 control-label">Student</label>
                        <div class="col-sm-9">
                          <input class="form-control" placeholder="Student Name" name="Student" type="text" required
                                    id="inputStudent" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputClass" class="col-sm-3 control-label">Class</label>
                        <div class="col-sm-9">
                          <input class="form-control" placeholder="Class Name" name="Class" type="text" required
                                    id="inputClass" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPassword" class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-9">
			    		  <input class="form-control" placeholder="password" name="Password" type="password" value="" required
                                    pattern=".{6,}" title="Password Minimum Length 6" id="inputPassword"  />
                          <input class="form-control" placeholder="Retype Password" name="Repassword" type="password" required
                                    pattern=".{6,}" title="PAssword Minumum Length 6" />
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-12">
			    		    <input class="btn btn-lg btn-success btn-block" type="submit" value="Submit">
                        </div>
                      </div>
                    </form>
			    </div>

                <div class="panel-footer text-center clearfix">Already Registered? <a href='{{urlfor "LoginController.Login"}}'>Login »</a></div>

			</div>
		</div>
	</div>
</div>

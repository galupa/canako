

<div class="container">
    <div class="row vertical-offset-50">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>Create New Report</strong></h3>
			 	</div>

			  	<div class="panel-body">
			    	<form accept-charset="utf-8" role="form" enctype="multipart/form-data" class="form-horizontal" method="POST" action='{{urlfor "ReportController.CreateForm"}}'>
                      {{ .xsrfdata }}

                      {{template "alert.tpl" .}}

                      <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">Kids Email</label>
                        <div class="col-sm-9">
                          <input class="form-control" placeholder="example: admin@example.com" name="User" value="{{.email}}" type="email" required
                                    id="inputEmail" readonly/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputDate" class="col-sm-3 control-label">Date</label>
                        <div class="col-sm-9">
			    		  <input class="form-control" placeholder="password" name="Date" type="text" value="{{.now}}" required
                                    disabled  />
                        </div>
                      </div>
                        <div class="form-group">
                          <label for="input info" class="col-sm-3 control-label">Report</label>
                          <div class="col-sm-9">
  			    		  <textarea class="form-control" name="Report" required
                                      title="Report Description" id="inputreport"  >
                                    </textarea>
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="filr" class="col-sm-3 control-label">Filename</label>
                          <div class="col-sm-9">
  			    		  <input type="file" name="file" id="file">
                          </div>
                        </div>
                        <div class="col-sm-12">
			    		    <input class="btn btn-lg btn-success btn-block" type="submit" value="Submit">
                        </div>
                      </div>
                    </form>
			    </div>

                <div class="panel-footer text-center clearfix"></div>

			</div>
		</div>
	</div>
</div>

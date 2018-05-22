

<div class="container">
    <div class="row vertical-offset-50">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>Report</strong></h3>
			 	</div>

			  	<div class="panel-body">
			    	<form accept-charset="utf-8" role="form" enctype="multipart/form-data" class="form-horizontal" method="POST" action='{{urlfor "ReportController.CreateForm"}}'>
                      {{ .xsrfdata }}

                      {{template "alert.tpl" .}}

                      <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">Kids Email</label>
                        <div class="col-sm-9">
                          <input class="form-control" name="User" value="{{.report.User}}" type="email" required
                                    id="inputEmail" disabled/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputDate" class="col-sm-3 control-label">Created</label>
                        <div class="col-sm-9">
			    		  <input class="form-control" placeholder="password" name="Date" type="text" value="{{.report.Created}}" required
                                    disabled  />
                        </div>
                      </div>
                        <div class="form-group">
                          <label for="input info" class="col-sm-3 control-label">Report</label>
                          <div class="col-sm-9">
  			    		  <textarea class="form-control" name="Report" required
                                      title="Report Description" id="inputreport"  disabled>
                                      {{.report.Report}}
                                    </textarea>
                          </div>
                        </div>
                        <div class="form-group" style="text-align: center">
                          <img src="/static/{{.report.Image}}" style="width:500px">
                        </div>

                        <div class="col-sm-12">
			    		                 <a href="?idx={{.previous}}&email={{.email}}">Previous</a> <a href="?idx={{.next}}&email={{.email}}">Next</a>
                        </div>
                      </div>
                    </form>
			    </div>

			</div>
		</div>
	</div>
</div>

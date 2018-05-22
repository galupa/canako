

<div class="container">
    <div class="row vertical-offset-50">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>Info</strong></h3>
			 	</div>

			  	<div class="panel-body">
			    	<form accept-charset="utf-8" role="form" enctype="multipart/form-data" class="form-horizontal" method="POST" action='{{urlfor "ReportController.CreateForm"}}'>
                      {{ .xsrfdata }}

                      {{template "alert.tpl" .}}

                      <div class="form-group">
                        <label for="inputStart" class="col-sm-3 control-label">Start</label>
                        <div class="col-sm-9">
                          <input class="form-control" value="{{.info.Date}}" type="text"
                                     disabled/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputDate" class="col-sm-3 control-label">End</label>
                        <div class="col-sm-9">
			    		  <input class="form-control" type="text" value="{{.info.End}}"
                                    disabled  />
                        </div>
                      </div>
                        <div class="form-group">
                          <label for="input info" class="col-sm-3 control-label">Info</label>
                          <div class="col-sm-9">
  			    		  <textarea class="form-control" name="Report" required
                                      title="Info Detail" disabled>
                                      {{.info.Info}}
                                    </textarea>
                          </div>
                        </div>
                        <div class="form-group" style="text-align: center">
                          <img src="/static/info/{{.info.Id}}{{.info.Image}}" style="width:500px">
                        </div>

                        <div class="col-sm-12">
			    		                 <a onclick="window.history.back();" href="#">Back</a>
                        </div>
                      </div>
                    </form>
			    </div>

			</div>
		</div>
	</div>
</div>

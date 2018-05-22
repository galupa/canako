

<div class="container">
    <div class="row vertical-offset-50">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>New Info</strong></h3>
			 	</div>

			  	<div class="panel-body">
			    	<form accept-charset="utf-8" role="form" enctype="multipart/form-data" class="form-horizontal" method="POST" action='{{urlfor "InfoController.CreateForm"}}'>
                      {{ .xsrfdata }}

                      {{template "alert.tpl" .}}

                      <div class="form-group">
                        <label for="input Date" class="col-sm-3 control-label">Start</label>
                        <div class="col-sm-9">
                          <input class="form-control inputDate" placeholder="input date" name="Date" required
                                    id="inputDate" />

                        </div>
                      </div>
                      <div class="form-group">
                        <label for="input Date" class="col-sm-3 control-label">End</label>
                        <div class="col-sm-9">
                          <input class="form-control inputDate" placeholder="input date" name="End"
                                    id="inputDate" />

                        </div>
                      </div>
                      <div id='calendar'></div>
                      <script type="text/javascript">
                          $(function () {
                              $('.inputDate').datetimepicker({
                                  format: 'DD/MM/YYYY hh:mmA',
                              });
                          });
                      </script>
                      <div class="form-group">
                        <label for="input info" class="col-sm-3 control-label">Info</label>
                        <div class="col-sm-9">
			    		  <textarea class="form-control" name="Info" required
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
                      <div class="form-group">
                        <label for="input info" class="col-sm-3 control-label">Target</label>
                        <div class="col-sm-9">
                          <input type="checkbox" name="target" value="all" onchange='handleChange(this);' checked> All Student<br>
                          {{range $key, $val := .users}}
                          <input type="checkbox" class="student_id" name="target" value="{{$val.Id}}" disabled > {{$val.Student}}<br>
                          {{end}}

                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-12">
			    		    <input class="btn btn-lg btn-success btn-block" type="submit" value="Submit">
                        </div>
                      </div>
                    </form>
			    </div>

                <div class="panel-footer text-center clearfix">View other info? <a href='{{urlfor "LoginController.Login"}}'>View Infos »</a></div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function handleChange(checkbox) {
  if(checkbox.checked == false){
      $(".student_id").prop("disabled", false);
  }else{
      $(".student_id").prop("disabled", true);
 }
}
</script>

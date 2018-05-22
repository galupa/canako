

<div class="container">
    <div class="row vertical-offset-50">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="panel panel-default">
			  	<div class="panel-heading text-center">
			    	<h3 class="panel-title"><strong>Welcome</strong></h3>
			 	</div>

			  	<div class="panel-body">
                      {{ .xsrfdata }}

                      {{template "alert.tpl" .}}

                      <div>
                        <div class="col-sm-10">
                          <a href="/report">View Report</a>
                        </div>
                        <div class="col-sm-2">
                          <a href="/info">View Info</a>
                        </div>
                      </div>

			    </div>
			</div>
		</div>
	</div>
</div>

<div class="container">
    <div class="row vertical-offset-75">

        {{template "alert.tpl" .}}
        {{range $key, $val := .users}}
        <p>{{$val.Student}} ({{$val.Email}}) <a href="/report/create?email={{$val.Email}}">Create Report</a> |
          <a href="/report?email={{$val.Email}}">View Report</a></p>
        {{end}}


    </div>
</div>


<header id="topbar" class="navbar navbar-default navbar-fixed-top bs-docs-nav" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Canako</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a style="font-size: 14px;" class="navbar-brand" rel="home" href="/" >
      </a>
    </div>

    <nav class="navbar-collapse bs-navbar-collapse collapse" role="navigation" style="height: 1px;">
      <ul itemscope="itemscope" itemtype="http://www.schema.org/SiteNavigationElement" class="nav navbar-nav">
        {{ if .Userinfo}}
        {{if eq .Userinfo.Privilege 1}}
        <li itemprop="name"><a itemprop="url" href='{{urlfor "UsersController.All"}}'>
          <span class="glyphicon glyphicon-user"></span>
        </a></li>
        {{end}}
        {{end}}
        <li itemprop="name"><a itemprop="url" href='{{urlfor "ReportController.Index"}}'>
          <span class="glyphicon glyphicon-book"></span>
        </a></li>
        <li itemprop="name"><a itemprop="url" href='{{urlfor "InfoController.All"}}'>
          <span class="glyphicon glyphicon-calendar"></span>
        </a></li>
        {{ if .Userinfo}}
        {{if eq .Userinfo.Privilege 1}}
        <li itemprop="name"><a itemprop="url" href='{{urlfor "InfoController.CreateForm"}}'>
          <span class="glyphicon glyphicon-bullhorn"></span>
        </a></li>
        {{end}}
        {{end}}
      </ul>

      <ul itemscope="itemscope" itemtype="http://www.schema.org/SiteNavigationElement" class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class='glyphicon glyphicon-info-sign'></span> Account <b class="caret"></b>
          </a>
          <ul itemprop="name" class="dropdown-menu">
            {{if .IsLogin}}
                <li itemprop="name" ><a itemprop="url" href='{{urlfor "LoginController.Logout"}}'>
                  <span class='glyphicon glyphicon-bullhorn'></span> Logout
                </a></li>
            {{else}}
                <li itemprop="name" ><a itemprop="url" href='{{urlfor "LoginController.Login"}}'>
                  <span class='glyphicon glyphicon-globe'></span> Login
                </a></li>
            {{end}}
          </ul>
        </li>
      </ul>
    </nav>
  </div>

</header>

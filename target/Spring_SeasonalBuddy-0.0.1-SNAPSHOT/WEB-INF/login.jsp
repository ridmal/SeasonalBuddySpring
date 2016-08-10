<%-- 
    Document   : login
    Created on : 18-Nov-2015, 10:46:34
    Author     : ridmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SeasonalBuddy</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">

        <!-- Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
       <div class = "container">
<div class = "row">
<div class = "col-md-6">

    <div class="brand">Seasonal Buddy</div>
</div>
    <!-- Navigation -->
    <div class = "col-md-6">
    <nav class="navbar navbar-default" role="navigation">
      

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.jsp">Seasonal Buddy</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index"><b>Home</b></a>
                    </li>
                 <li>
                     <a href="about"><b>About</b></a>
                    </li>
                    <li>
                        <a href="blog"><b>Blog</b></a>
                    </li>
                    <li>
                          <a href="merchants"><b>Merchants</b></a>
                    </li>
                    <li>
                    <a href="login"><b>Log in</b></a>
                    </li>
                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
      
        <!-- /.container -->
    </nav>
    </div>
    </div>
    </div>

    <div class="container">

        <div class="row">
            <div class ="col-md-6">

               
            <div class ="row">
                <div class ="box2 text-center ">    
                    <p class ="text-center">You Don't have a Account</p>
                    <p class = "text-center">Please Sign In from Here</p>
                    <p> <a href ="signin" class ="btn btn-primary text-center">Sign In </a></p>
                </div>
            </div>
                
                 <div class ="row">
                     
                     <div class="box4">
                         <div class ="text-center"> <hr><h5>Please Login to Download the Mobile Application</h5><hr></div>
                    <form action ="usergetdata" method ="POST">
                        
                        <div class ="form-group">
                            <label for ="uname">User Name</label>
                            <input type ="text" name ="uname" class = "form-control">
                        </div>
                        <div class ="form-group">
                            <label for ="pass">Password</label>
                            <input type ="password" name ="pass" class = "form-control">
                        </div>
                        <div class ="col-md-6 text-right">
                            <button type ="submit" class ="btn btn-primary">Log IN </button>
                        </div>
                </form> 
                </div>
                </div>
               
            </div>

            <div class ="col-md-1"></div>
            
            <div class="col-md-4 text-right">
                <div class ="box5">
                <div id="carousel-example-generic" class="carousel slide">
                    <!-- Indicators -->
                    <ol class="carousel-indicators hidden-xs">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                           <li data-target="#carousel-example-generic" data-slide-to="6"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/3.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/4.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/5.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/6.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full3" src="img/seasonalBuddy_slides/7.jpg" alt="">
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="icon-prev"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="icon-next"></span>
                    </a>
                </div>
            </div>
            </div>


        </div>     



        
      


    </div>





    
    



<!-- /.container -->


<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval: 2000//changes the speed
    })
</script>

</body>

</html>


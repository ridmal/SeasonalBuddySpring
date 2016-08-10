<%-- 
    Document   : index
    Created on : Nov 16, 2015, 5:47:18 PM
    Author     : ridmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

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
    <!--<link href="css/lightbox.min.css" rel="stylesheet">-->
      <link href="css/lightbox.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <script src="js/lightbox.min.js"></script>
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

    <div class="brand" >Seasonal Buddy</div>
</div>
    <!-- Navigation -->
    <div class = "col-md-6 " align="right">
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
                      <a href="#"  data-toggle="modal" data-target ="#modal-merchant_login" ><b>Merchants</b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
       
        <!-- /.container -->
    </nav>
    </div>
    </div>
    </div>

    <!--   model for login to go for the merchant side  -->  <!--  We have to create automatically access if remember me is click  -->
        <div class = "modal fade" id = "modal-merchant_login"> 
                        <div class ="modal-dialog">
                            <div class ="modal-content">
                                <div class ="modal-header modal-header-success">
                                    <button type ="button" class ="close" data-dismiss ="modal" style="color:white"> &times;</button>
                                    <h3 class ="modal-title"><strong>Welcome!!!!!</strong> Have a Good Day</h3>
                                </div>
                                <div class ="modal-body">
                                     <div class ="row">
                     
                     <div class="box4">
                         <div class ="text-center"> <hr><h5>Please Login for go to Merchant Page</h5><hr></div>
                    <form action ="/merchantlogin" method ="POST">
                        
                        <div class ="form-group col-md-12">
                            <lable for ="uname">User Name</lable>
                            <input type ="text" name ="muname" class = "form-control">
                        </div>
                        <div class ="form-group col-md-12">
                            <lable for ="pass">Password</lable>
                            <input type ="password" name ="mpass" class = "form-control">
                            <p></p>
                        </div>
                   <div class = "col-md-6">
                 <a href = "/merchantsignin">Sign in from Here</a></div>
                        <div class ="col-md-6 text-right">
                            <button type ="submit" class ="btn btn-primary">Log IN </button>
                        </div>
                       
                </form> 
                </div>
                </div>
                                </div>
                            </div>     
                        </div>
                        </div>
    
    
    
    <div class="container">

        <div class="row">


            <div class="box">
                <div class ="row">
                <div class="col-md-8 text-center">
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
                                <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-01.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-02_2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-03.jpg" alt="">
                            </div>
                             <div class="item">
                                 <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-04.jpg" alt="">
                             </div>
                             <div class="item">
                                 <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-05.jpg" alt="">
                             </div>
                             <div class="item">
                                 <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-06_2.jpg" alt="">
                             </div>
                            <div class="item">
                                 <img class="img-responsive1 img-full" src="img/frontpage_slides/slide-30.jpg" alt="">
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
                <div class = "col-md-4">
                    <div class ="row">
                        <hr>
                        <h4 class = "text-center">Download SeasonalBuddy Mobile App</h4>
                    <hr>   
                                       
                    <div class = "text-center"><button type="button" class = "btn btn-primary"
                                                       data-toggle="modal" data-target ="#modal-1">Click Here</button>
                    </div>
                    <div class = "modal fade" id = "modal-1">
                        <div class ="modal-dialog">
                            <div class ="modal-content">
                                <div class ="modal-header modal-header-success">
                                    <button type ="button" class ="close" data-dismiss ="modal" style="color:white"> &times;</button>
                                     <h3 class ="modal-title"><strong>Welcome!!!!!</strong> Have a Good Day</h3>
                                </div>
                                <div class ="modal-body">
                                     <div class ="row">
                     
                     <div class="box4">
                         <div class ="text-center"> <hr><h5>Please Login to Download the Mobile Application</h5><hr></div>
                    <form action ="usergetdata" method ="POST">
                        
                        <div class ="form-group">
                            <lable for ="uname">User Name</lable>
                            <input type ="text" name ="uname" class = "form-control">
                        </div>
                        <div class ="form-group">
                            <lable for ="pass">Password</lable>
                            <input type ="password" name ="pass" class = "form-control">
                        </div>
                        <div class="col-md-6"><a href="signin">You dont have a Account.Sign in Here</a></div>
                        <div class ="col-md-6 text-right">
                            <button type ="submit" class ="btn btn-primary">Log IN</button>
                        </div>
                </form> 
                </div>
                </div>
                                </div>
                            </div>     
                        </div>
                        </div>
                                </div>      
                    <div class ="row">
         
                                             <div><img class="img-responsive text-center" style="width:150px;height:150px" src="img/SeasoanlBuddy.png" alt=""></img></div> 
                                          
                                           
                                            <div class = " well text-center " ><b>You can Give Your Greeting to Anyone You Love</b></div>
                    </div>
                                       
               </div>
              
                    <div class ="raw">
                        <div class = "col-md-3">
                    <div class = "text-center"><h6><b>Get Seasonal Cards</b></h6></div>           
                   <div class = "text-center"><a href="seasonalcards" class =" btn btn-primary "> Click Here </a></div>
               </div>
                      <div class = "col-md-3">
                    <div class = "text-center"><h6><b>Get Seasonal Clips</b></h6></div>           
                   <div class = "text-center"><a href="seasonalclips" class =" btn btn-danger "> Click Here </a></div>
               </div>
                      <div class = "col-md-3">
                    <div class = "text-center"><h6><b>Get Seasonal templates</b></h6></div>           
                   <div class = "text-center"><a href="seasonaltemplates" class =" btn btn-warning "> Click Here </a></div>
               </div>
                     <div class = "col-md-3">
                    <div class = "text-center"><h6><b>Get Seasonal Games</b></h6></div>           
                   <div class = "text-center"><a href="Seasonalgames" class =" btn btn-success "> Click Here </a></div>
               </div>
                </div>
                </div>
            </div>
          </div>
        <section id="features">
        <div class="row">
            <div class="box">
                <div class="col-md-12">
                    <hr>
                    <h2 class="intro-text text-center">Seasonal Buddy
                        <strong>Mobile App</strong>
                    </h2>
                    <hr>
                    
                    <hr class="visible-xs">
                    <p class = "text-center">
                        
                        Seasonal Buddy is a Greeting Card Making and Game Playing Android platform.
                   </p>
                   <div class = "well text-center">Introduced By <h1>WISDOM IT</h1></div>
                </div>
            </div>
        </div>
</section>
       

       
    </div>
    <!-- /.container -->


    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lightbox.min.js"></script>
    

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 2000 //changes the speed
    })
    </script>

</body>

</html>

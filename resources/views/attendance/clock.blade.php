<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>{{ config('app.name', 'Laravel') }}</title>
  <!-- loader-->
  <link href="{{ asset('frontend/assets/css/pace.min.css') }}" rel="stylesheet"/>
  <script src="{{ asset('frontend/assets/js/pace.min.js') }}"></script>
  <!--favicon-->
  <link rel="icon" href="{{ asset('frontend/assets/images/favicon.ico') }}" type="image/x-icon">
  <!-- Vector CSS -->
  <!--<link href="{{ asset('frontend/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css') }}" rel="stylesheet"/>-->
  <!-- simplebar CSS-->
  <link href="{{ asset('frontend/assets/plugins/simplebar/css/simplebar.css') }}" rel="stylesheet"/>
  <!-- Bootstrap core CSS-->
  <link href="{{ asset('frontend/assets/css/bootstrap.min.css') }}" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="{{ asset('frontend/assets/css/animate.css') }}" rel="stylesheet" type="text/css"/>
  <!-- Sidebar CSS-->
  <link href="{{ asset('frontend/assets/css/sidebar-menu.css') }}" rel="stylesheet"/>
  <!-- Icons CSS-->
  <link href="{{ asset('frontend/assets/css/icons.css') }}" rel="stylesheet" type="text/css"/>
  <!-- Custom Style-->
  <link href="{{ asset('frontend/assets/css/app-style.css') }}" rel="stylesheet"/>
  <script src="{{ asset('frontend/assets/js/jquery.min.js') }}"></script>
  <style>
      .card{
          background:white !important;
          color:black !important;
      }
      .card h3{
          color:#2195F0 !important;
      }
      .card p{ 
          color: grey !important;
      }
      .card h1{
          color: #21242A !important;
      }
      .card label{
          color: grey !important;
      } 
      .card input{
          border: 1px solid #dbd4d4;
          background-color: white;
          color: #000 !important;
      }
      .form-control:focus{
          background-color: white !important;
          box-shadow: 0 0 0 0.2rem rgb(255 255 255 / 45%);
      }
  </style>
  
</head>

<body class="bg-theme bg-theme1">
 
    <!-- Start wrapper-->
    <div id="wrapper" style="background:#badaf3;">
    <script src="{{asset('js/notifications.js')}}"></script>
    <div class="container-fluid">
        <div class="row" style="height: 100vh !important;">
            <div class="col-lg-5 col-xl-4 col-md-6 col-sm-6 align-self-center mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="clock-content text-center">
                            <h3>Workday</h3>
                            <p id="date" class="mt-2">Mon, July 12, 2022</p>
                            <h1 id="time" class="mt-1">11:09:23 PM</h1>
                            <div class="clock-form">
                                <div>
                                    <div class="form-group">
                                        <label for="ID">Enter User ID Number</label>
                                        <input id="user_id" type="text" class="form-control" placeholder="ID Number"> 
                                    </div>
                                    <div class="form-group">
                                        <div class="d-flex justify-content-between">
                                            <button type="submit" class="btn btn-success btn-round px-5 clock_in">Clock In</button>
                                            <button type="submit" class="btn btn-danger btn-round px-5 clock_out">Clock Out</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	    <div class="overlay toggle-menu"></div>
    </div>
<script>
    
    function get_date(){
        
        let objectDate = new Date();
        let weekday = objectDate.toLocaleString('default', { weekday: 'short' });
        let day = objectDate.getDate();
        let month = objectDate.toLocaleString('default', { month: 'short' });
        let year = objectDate.getFullYear();
        document.getElementById('date').innerHTML = `${weekday}, ${month} ${day}, ${year}`;
        
        var now = objectDate.toLocaleTimeString();
        document.getElementById('time').innerHTML = now;
        
    }
    setInterval(function(){
        get_date();
    }, 1000);
    get_date();
    
    function webclock(action){
        let objectDate = new Date();
        let day = objectDate.getDate();
        let month = objectDate.toLocaleString('default', { month: 'numeric' });
        let year = objectDate.getFullYear();
        var date = `${year}-${month}-${day}`;
        var time = objectDate.toLocaleTimeString("en-US", {hour: 'numeric', minute: '2-digit', hour12: false });
        var user_id = $('#user_id').val();
        var _token = '{{csrf_token()}}';
        
        $.ajax({
            url:'{{route('attendance.clock.submit')}}',
            method:'POST',
            data:{
                _token,
                user_id,
                time,
                date,
                action
            },
            beforeSend:function(res){
                $.notification(
                    ["Please wait sometime"],
                    {
                        position: ['top', 'right'],
                        messageType: 'success',
                        timeView: 5000,
                    }
                )
            },
            success:function(res){
                
                $.notification(
                    [res.message],
                    {
                        position: ['top', 'right'],
                        messageType: res.type,
                        timeView: 8000,
                    }
                );
                if(res.type != 'error'){
                    $("#user_id").val("");
                }
            },
            error:function(res){
                $.notification(
                    ["Something went wrong please try again"],
                    {
                        position: ['top', 'right'],
                        messageType: 'error',
                        timeView: 6000,
                    }
                )
            },
            
        });
        
    }
    
    
    $('.clock_in').click(function(){
        webclock('clock_in');
    });
    $('.clock_out').click(function(){
        webclock('clock_out');
    });
    
    
    
</script>
</div>
    
    <!-- Bootstrap core JavaScript-->
  <script src="{{ asset('frontend/assets/js/popper.min.js') }}"></script>
  <script src="{{ asset('frontend/assets/js/bootstrap.min.js') }}"></script>
  <!-- simplebar js -->
  <script src="{{ asset('frontend/assets/plugins/simplebar/js/simplebar.js') }}"></script>
  <!-- sidebar-menu js -->
  <script src="{{ asset('frontend/assets/js/sidebar-menu.js') }}"></script>
  <!-- loader scripts -->
  <!--<script src="{{ asset('frontend/assets/js/jquery.loading-indicator.js') }}"></script>-->
  <!-- Custom scripts -->
  <script src="{{ asset('frontend/assets/js/app-script.js') }}"></script>
  <!-- Chart js -->
  
  <script src="{{ asset('frontend/assets/plugins/Chart.js/Chart.min.js') }}"></script>
 
  <!-- Index js -->
  <script src="{{ asset('frontend/assets/js/index.js') }}"></script>
  
</body>
</html>
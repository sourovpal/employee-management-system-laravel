@extends('layouts.app')

@section('content')
    <style>
    #notifications-main{
        z-index:9999999999 !important;
    }
    </style>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-12">
          @include('message')
          <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h4 class="card-title">Clock In / Clock Out</h4>
                    </div>
                    <div>
                        
                    </div>
                </div>
			  <div class="table-responsive mt-4">
               <table class="table table-striped">
                  <thead>
                    <tr>
                      <th width="5%" scope="col">#</th>
                      <th width="10%" scope="col">Clock In</th>
                      <th width="10%" scope="col">Clock Out</th>
                      <th width="10%" scope="col">Total Hour</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    @foreach($worktime as $key => $work_time)
                    <tr>
                      <th>{{ $key+1 }}</th>
                      <td>{{ $work_time['start_time'] }}</td>
                      <td>{{ $work_time['end_time'] }}</td>
                      <td>{{ $work_time['total_hour'] }}</td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
            </div>
            </div>
          </div>
        </div>
      </div><!--End Row-->
	  
	  <!--start overlay-->
		  <div class="overlay toggle-menu"></div>
		<!--end overlay-->
		<!-- Modal -->
        
    </div>
    <!-- End container-fluid-->
    <script src="https://sourovpal.xyz/public/js/notifications.js"></script>
    
@endsection
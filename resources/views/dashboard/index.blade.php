@extends('layouts.app')

@section('content')
<style>
.col-xl-3.border-light{
    background: #ffffff0f;
}
</style>
<div class="container-fluid">
  <!--Start Dashboard Content-->
  <div class="card mt-3">
    @include('message')
    <div class="card-content">
        
      <div class="row row-group m-0">
        @can('Total Employee')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $user }}<span class="float-right"><i class="zmdi zmdi-accounts-add"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:55%"></div>
            </div>
            <p class="mb-0 text-white small-font">Total Employee</p>
          </div>
        </div>
        @endcan
        @can('Today Attends')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $attendance }}<span class="float-right"><i class="zmdi zmdi-assignment"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:55%"></div>
            </div>
            <p class="mb-0 text-white small-font">Today Attends</p>
          </div>
        </div>
        @endcan
        @can('Today Absent')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $user -  $attendance }} <span class="float-right"><i class="zmdi zmdi-grid"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:55%"></div>
            </div>
            <p class="mb-0 text-white small-font">Today Absent</p>
          </div>
        </div>
        @endcan
        @can('Total Employee')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $branch }} <span class="float-right"><i class="zmdi zmdi-balance"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:55%"></div>
            </div>
            <p class="mb-0 text-white small-font">Branch</p>
          </div>
        </div>
        @endcan
        
        </div>
      <!-- row -->
      
    </div>
    <br<br>
    @canany(['Employee Work Day', 'Employee Total Present', 'Employee Total Absent', 'Employee Total Rest Day'])
    <div class="card-content">
      
        <div class="row row-group m-0">
        
        <!---->
        @can('Employee Work Day')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $totalWorkDay }} / {{$totalDay}}<span class="float-right"><i class="zmdi zmdi-walk"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:{{ ((100/$totalDay)*$totalWorkDay) }}%"></div>
            </div>
            <p class="mb-0 text-white small-font">Total Work Day</p>
          </div>
        </div>
        @endcan
        @can('Employee Total Present')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $totalPresent }} / {{$totalWorkDay}}<span class="float-right"><i class="zmdi zmdi-assignment"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:{{ ((100/$totalWorkDay)*$totalPresent) }}%"></div>
            </div>
            <p class="mb-0 text-white small-font">Total Present</p>
          </div>
        </div>
        @endcan
        @can('Employee Total Absent')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $totalAbsent }} / {{ $totalWorkDay }}<span class="float-right"><i class="zmdi zmdi-grid"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:{{ ((100/$totalWorkDay)*$totalAbsent) }}%"></div>
            </div>
            <p class="mb-0 text-white small-font">Total Absent or Due</p>
          </div>
        </div>
        @endcan
        @can('Employee Total Rest Day')
        <div class="col-12 col-lg-6 col-xl-3 border-light">
          <div class="card-body">
            <h5 class="text-white mb-0">{{ $totalRestDay }} / {{$totalDay}}<span class="float-right"><i class="zmdi zmdi-balance"></i></span></h5>
            <div class="progress my-3" style="height:3px;">
              <div class="progress-bar" style="width:{{ ((100/$totalDay)*$totalRestDay) }}%"></div>
            </div>
            <p class="mb-0 text-white small-font">Total Rest Day</p>
          </div>
        </div>
        @endcan
        
        
      </div>
      <!-- row -->
      
    </div>
    @endcanany
  </div>
  @can('Today Clock In Clock Out')
    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-header">Today Clock IN / Clock OUT</div>
          <div class="card-body">
              <div class="table-responsive">
                <table id="myTable" class="table table-striped">
                      <thead>
                        <tr>
                          <th width="5%" scope="col">#</th>
                          <th width="5%" scope="col">User ID</th>
                          <th width="5%" scope="col">Employee</th>
                          <th width="10%" scope="col">Clock IN</th>
                          <th width="10%" scope="col">Clock OUT</th>
                          <th width="10%" scope="col">Total Hour</th>
                        </tr>
                      </thead>
                      
                      <tbody>
                        @foreach($workTime as $key => $work_time)
                        <tr>
                            @php
                            $user = \App\Models\User::find($work_time['user_id']);
                            @endphp
                          <th>{{ $key+1 }}</th>
                          <td>{{ $user->user_id }}</td>
                          <td>{{ ucwords($user->name) }}</td>
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
    </div>
    @endcan
      <!--start overlay-->
      <div class="overlay toggle-menu"></div>
      <!--end overlay-->
</div>
<!-- End container-fluid-->
@endsection

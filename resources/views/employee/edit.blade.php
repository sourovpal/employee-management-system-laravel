@extends('layouts.app')

@section('content')

    <div class="container-fluid">

    <div class="row mt-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h4 class="card-title">Edit Employee/Manager</h4>
                    </div>
                    <div>
                        <a href="{{ route('employee.index') }}" class="btn btn-light btn-round">View Employess</a>
                    </div>
                </div>
                <hr>
                <form action="{{route('employee.update', ['id' => $user->id ])}}" method="post">
                    
                    @include('message')
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="input-6">User ID</label>
                        <input type="text" name="user_id" class="form-control   {{$errors->has('user_id')?'is-invalid':''}}" id="input-6" placeholder="Enter Unique ID" value="{{$user->user_id}}">
                        <span class="invalid-feedback">{{$errors->first('user_id')}}</span>
                    </div>
                    <div class="form-group">
                        <label for="input-6">Full Name</label>
                        <input type="text" name="name" class="form-control {{$errors->has('name')?'is-invalid':''}}" id="input-6" placeholder="Enter Employee Name" value="{{$user->name}}">
                        <span class="invalid-feedback">{{$errors->first('name')}}</span>
                    </div>
                    <div class="form-group">
                        <label for="input-7">Email</label>
                        <input type="text" name="email" class="form-control {{$errors->has('email')?'is-invalid':''}}" id="input-7" placeholder="Enter Employee Email" value="{{$user->email}}">
                        <span class="invalid-feedback">{{$errors->first('email')}}</span>
                    </div>
                    <div class="form-group">
                        <label for="input-8">Mobile</label>
                        <input type="text" name="phone" class="form-control {{$errors->has('phone')?'is-invalid':''}}" id="input-8" placeholder="Enter Employee Mobile Number" value="{{$user->phone}}">
                        <span class="invalid-feedback">{{$errors->first('phone')}}</span>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="input-8">Gender</label>
                                <select class="form-control {{$errors->has('gender')?'is-invalid':''}}" name="gender">
                                    <option value="">CHOOSE</option>
                                    <option @if($user->gender == 'male') selected @endif value="male">Male</option>
                                    <option @if($user->gender == 'female') selected @endif value="female">Female</option>
                                </select>
                                <span class="invalid-feedback">{{$errors->first('gender')}}</span>
                            </div>
                            <div class="col">
                                <label for="input-8">Worker Eligibility</label>
                                <select class="form-control {{$errors->has('civil')?'is-invalid':''}}" name="civil">
                                    <option value="">CHOOSE</option>
                                    <option @if($user->civil == 'US work authorization') selected @endif value="US work authorization">US work authorization</option>
                                    <option @if($user->civil == 'Green Card') selected @endif  value="Green Card">Green Card</option>
                                    <option @if($user->civil == 'US Citizens') selected @endif  value="US Citizens">US Citizens</option>
                                    <option @if($user->civil == 'H-2A') selected @endif  value="H-2A">H-2A</option>
                                    <option @if($user->civil == 'H-2B') selected @endif  value="H-2B">H-2B</option>
                                    <option @if($user->civil == '1099') selected @endif  value="1099">1099 ( independent contractor)</option>
                                    <option @if($user->civil == 'J1') selected @endif  value="J1">J1</option>
                                </select>
                                <span class="invalid-feedback">{{$errors->first('civil')}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="input-8">Date Of Birth</label>
                                <input type="date" class="form-control {{$errors->has('birth_date')?'is-invalid':''}}" name="birth_date" id="input-8" placeholder="" value="{{date("Y-m-d", strtotime($user->birth_date))}}">
                                <span class="invalid-feedback">{{$errors->first('birth_date')}}</span>
                            </div>
                            <div class="col">
                                <label for="input-8">Age</label>
                                <input type="number" class="form-control {{$errors->has('age')?'is-invalid':''}}" name="age" id="input-8" placeholder="Enter Employee Age" value="{{$user->age}}">
                                <span class="invalid-feedback">{{$errors->first('age')}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-8">National ID</label>
                        <input type="text" name="national_id" class="form-control {{$errors->has('national_id')?'is-invalid':''}}" id="input-8" placeholder="Enter Employee ID Number" value="{{$user->national_id}}">
                        <span class="invalid-feedback">{{$errors->first('national_id')}}</span>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="input-8">Department</label>
                                <input type="text" class="form-control {{$errors->has('department')?'is-invalid':''}}" name="department" id="input-8" placeholder="Enter Employee Department" value="{{$user->department}}">
                                <span class="invalid-feedback">{{$errors->first('department')}}</span>
                            </div>
                            <div class="col">
                                <label for="input-8">Position</label>
                                <input type="text" class="form-control {{$errors->has('position')?'is-invalid':''}}" name="position" id="input-8" placeholder="Enter Employee Position" value="{{$user->position}}">
                                <span class="invalid-feedback">{{$errors->first('position')}}</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="input-8">Select Role</label>
                                <select class="form-control {{$errors->has('role')?'is-invalid':''}}" name="role">
                                    <option value="">CHOOSE</option>
                                    @foreach(\App\Models\Role::get() as $row)
                                    <option @if(count($user->roles) > 0 && $user->roles[0]->name == $row->name) selected @endif value="{{$row->name}}">{{$row->name}}</option>
                                    @endforeach
                                </select>
                                <span class="invalid-feedback">{{$errors->first('role')}}</span>
                            </div>
                            <div class="col">
                                <label for="input-8">Select Branch</label>
                                <select class="form-control {{$errors->has('branch')?'is-invalid':''}}" name="branch">
                                    <option value="">CHOOSE</option>
                                    @foreach(\App\Models\Branch::get() as $row)
                                    <option @if($user->branch_id == $row->id) selected @endif value="{{$row->id}}">{{$row->name}}</option>
                                    @endforeach
                                </select>
                                <span class="invalid-feedback">{{$errors->first('branch')}}</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- <div class="form-group">
                        <label for="input-9">Password</label>
                        <input type="password" name="password" class="form-control {{$errors->has('password')?'is-invalid':''}}" id="input-9" placeholder="Enter Password">
                        <span class="invalid-feedback">{{$errors->first('password')}}</span>
                    </div>
                    <div class="form-group">
                        <label for="input-10">Confirm Password</label>
                        <input type="password" name="confirm_password" class="form-control {{$errors->has('confirm_password')?'is-invalid':''}}" id="input-10" placeholder="Confirm Password">
                        <span class="invalid-feedback">{{$errors->first('confirm_password')}}</span>
                    </div> -->
                    <div class="form-group">
                        <button type="submit" class="btn btn-light btn-round px-5"><i class="icon-lock"></i> Update</button>
                    </div>
                </form>
                </div>
             </div>
        </div>
    </div><!--End Row-->

	<!--start overlay-->
		  <div class="overlay toggle-menu"></div>
		<!--end overlay-->

    </div>
    <!-- End container-fluid-->

@endsection
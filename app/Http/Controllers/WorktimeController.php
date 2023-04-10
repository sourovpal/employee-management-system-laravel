<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Attendance;
use App\Models\Schedule;
use App\Models\WorkTime;
use App\Http\Resources\WorktimeResource;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class WorktimeController extends Controller
{
    
    private $user;
    public function __construct(){
        $this->middleware("auth");
        $this->middleware(function($request, $next){
            $this->user = auth()->user();
            return $next($request);
        });
    }
    
    public function index(Request $request){
        // if($this->user->canany(['Leave Request Send', 'Leave Request'])){
        
            $collection = WorkTime::where('attendance_id', $request->id)->get();
            $worktime = json_decode(WorktimeResource::collection($collection)->toJson(), true);
            return view('worktime.index', compact('worktime'));     
            
            
            // }
        // return abort('403');
    }
    
    
    public function store(Request $request){
            
    }
    
    public function update(Request $request){
        
    }
    
    
    public function delete(Request $request){
        
    }
}

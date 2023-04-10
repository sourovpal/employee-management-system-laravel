<?php

namespace App\Http\Resources;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class WorktimeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        
        $totalHour = '0 hr 0 mins';
        if($this->start_time && $this->end_time){
            $start = Carbon::parse($this->start_time);
            $end = Carbon::parse($this->end_time);
            $diff = $end->diff($start);
            $hours = $diff->h;
            $hours = $hours + ($diff->days*24);
            $totalHour = $hours.' hr '. $diff->i .' mins';
        }
        
        return [
                'id' => $this->id,
                'user_id' => $this->user_id,
                'attendance_id' => $this->attendance_id,
                'start_time' => date('h:i A', strtotime($this->start_time)),
                'end_time' => date('h:i A', strtotime($this->end_time)),
                'total_hour' => $totalHour,
            ];
        
        
        
    }
}

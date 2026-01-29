<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Court;
use App\Models\Booking;
use Illuminate\Http\Request;

class CourtController extends Controller
{
    /**
     * List all courts
     */
    public function index()
    {
        $courts = Court::all();

        return response()->json([
            'success' => true,
            'data' => $courts,
        ]);
    }

    /**
     * Check court availability
     * params: date, start_time, end_time
     */
    public function availability(Request $request, $courtId)
    {
        $request->validate([
            'date'       => 'required|date',
            'start_time' => 'required',
            'end_time'   => 'required|after:start_time',
        ]);

        $isBooked = Booking::where('court_id', $courtId)
            ->where('date', $request->date)
            ->whereIn('status', ['pending', 'paid'])
            ->where(function ($query) use ($request) {
                $query->whereBetween('start_time', [$request->start_time, $request->end_time])
                      ->orWhereBetween('end_time', [$request->start_time, $request->end_time])
                      ->orWhere(function ($q) use ($request) {
                          $q->where('start_time', '<=', $request->start_time)
                            ->where('end_time', '>=', $request->end_time);
                      });
            })
            ->exists();

        return response()->json([
            'success' => true,
            'available' => !$isBooked,
        ]);
    }
}

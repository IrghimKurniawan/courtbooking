<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Court extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'type',
        'price_per_hour',
    ];

    // 🔁 Relasi: 1 court punya banyak booking
    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}

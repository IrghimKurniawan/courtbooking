<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Court;

class CourtSeeder extends Seeder
{
    public function run(): void
    {
        Court::insert([
            [
                'name' => 'Futsal Court A',
                'image' => 'assets/images/futsal.png',
                'type' => 'Indoor',
                'facility' => 'Air Conditioned',
                'rating' => 4.8,
                'price' => 50000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Basketball Court B',
                'image' => 'assets/images/basket.png',
                'type' => 'Outdoor',
                'facility' => 'Premium Floor',
                'rating' => 4.7,
                'price' => 75000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Badminton Court C',
                'image' => 'assets/images/badmin.png',
                'type' => 'Indoor',
                'facility' => 'Wooden Floor',
                'rating' => 4.9,
                'price' => 45000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Tennis Court D',
                'image' => 'assets/images/tennis.png',
                'type' => 'Outdoor',
                'facility' => 'Hard Surface',
                'rating' => 4.6,
                'price' => 80000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Volley Court E',
                'image' => 'assets/images/volley.png',
                'type' => 'Indoor',
                'facility' => 'Synthetic Floor',
                'rating' => 4.5,
                'price' => 60000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}

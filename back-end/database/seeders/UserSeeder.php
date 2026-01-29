<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        User::create([
            'name' => 'irghi',
            'email' => 'irghi@mail.com',
            'password' => Hash::make('user123'),
        ]);

        User::create([
            'name' => 'asep',
            'email' => 'asep@mail.com',
            'password' => Hash::make('admin123'),
            'role' => 'admin',
        ]);

    }
}

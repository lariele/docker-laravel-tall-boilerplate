<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Lariele\Order\Models\Order;

class OrderSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Order::factory(1000)->create();
    }
}

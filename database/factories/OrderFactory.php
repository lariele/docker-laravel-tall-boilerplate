<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Lariele\Order\Enums\OrderStatus;
use Lariele\Order\Models\Order;

/**
 * @extends Factory
 */
class OrderFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Order::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'customer_name' => $this->faker->name,
            'customer_address' => $this->faker->address,
            'ordered_at' => $this->faker->dateTime(),
            'price' => $this->faker->randomFloat(2,30, 1200),
            'status' => $this->faker->randomElement(OrderStatus::toValues()),
        ];
    }
}

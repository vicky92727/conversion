<?php

namespace Database\Factories;

use App\Models\Session;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class SessionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Session::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'activated_at' => $this->faker->dateTimeBetween($startDate = '-2 months', $endDate = 'now'),
            'appointment_at' => $this->faker->dateTimeBetween($startDate = '-1 months', $endDate = 'now'),
            'user_id' => $this->faker->numberBetween($min = 1, $max = 5)
        ];
    }
}

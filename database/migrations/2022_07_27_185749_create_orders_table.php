<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('customer_name')->index();
            $table->string('customer_address')->index();
            $table->dateTime('ordered_at')->index();
            $table->float('price',8,2)->nullable()->index();
            $table->enum('status', \Lariele\Order\Enums\OrderStatus::toValues())->default(\Lariele\Order\Enums\OrderStatus::new())->index();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};

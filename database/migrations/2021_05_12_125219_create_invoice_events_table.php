<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoiceEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoice_events', function (Blueprint $table) {
            $table->id();
            $table->enum('event_name', ['registered', 'activated', 'appointment']);
            $table->decimal('event_amount', 8, 2);
            $table->integer('occurence');
            $table->integer('user_id');
            $table->foreignId('invoice_id')
                  ->constrained()
                  ->onUpdate('cascade')
                  ->onDelete('cascade');
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
        Schema::dropIfExists('invoice_events');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'start_date',
        'end_date',
        'amount',
        'customer_id'
    ];

    /**
     * Get the phone associated with the user.
     */
    public function events()
    {
        return $this->hasMany(InvoiceEvent::class);
    }
}

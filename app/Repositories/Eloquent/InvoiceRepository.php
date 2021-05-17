<?php 

namespace App\Repositories\Eloquent;

use App\Models\Invoice;
use Illuminate\Database\Eloquent\Model;
use App\Repositories\InvoiceRepositoryInterface;
class InvoiceRepository extends BaseRepository implements InvoiceRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Invoice $model)
    {
        $this->model = $model;
    }

}
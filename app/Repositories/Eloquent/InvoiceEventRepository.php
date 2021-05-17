<?php 

namespace App\Repositories\Eloquent;

use App\Models\InvoiceEvent;
use Illuminate\Database\Eloquent\Model;
use App\Repositories\InvoiceEventRepositoryInterface;
class InvoiceEventRepository extends BaseRepository implements InvoiceEventRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(InvoiceEvent $model)
    {
        $this->model = $model;
    }

}
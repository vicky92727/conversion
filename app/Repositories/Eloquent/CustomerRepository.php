<?php 

namespace App\Repositories\Eloquent;

use App\Models\Customer;
use Illuminate\Database\Eloquent\Model;
use App\Repositories\CustomerRepositoryInterface;
class CustomerRepository extends BaseRepository implements CustomerRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Customer $model)
    {
        $this->model = $model;
    }

}
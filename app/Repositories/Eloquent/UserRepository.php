<?php 

namespace App\Repositories\Eloquent;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use App\Repositories\UserRepositoryInterface;
class UserRepository extends BaseRepository implements UserRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(User $model)
    {
        $this->model = $model;
    }

    public function getAllUsersByCustomer($id, $from, $to)
    {
    	return $this->model->select('id','name','email','customer_id','created_at')
    				->where('customer_id', $id)->with(
				    		array('sessions' => function($query) use ($from, $to){
									$query->select('id','activated_at','appointment_at','user_id')
									      ->whereBetween('activated_at', [$from, $to])
										  ->orWhereBetween('appointment_at', [$from, $to]);
								}))->get();
    }
}
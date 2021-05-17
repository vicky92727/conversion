<?php 

namespace App\Repositories\Eloquent;

use App\Models\Session;
use Illuminate\Database\Eloquent\Model;
use App\Repositories\SessionRepositoryInterface;
class SessionRepository extends BaseRepository implements SessionRepositoryInterface
{
    // model property on class instances
    protected $model;

    // Constructor to bind model to repo
    public function __construct(Session $model)
    {
        $this->model = $model;
    }

}
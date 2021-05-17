<?php
namespace App\Repositories;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

interface EloquentRepositoryInterface
{
	/**
    * Get all models
    * @param array $columns
    * @param array $relations
    *
    * @return Collection
    */
    public function all(array $columns = ['*'], array $relations=[]): Collection;
	/**
     * Get's a invoice by it's ID
     *
     * @param int $id
     * @param array $columns
     * @param array $relations
     * @param array $appends
     * @return Model
     */
    public function findById(int $id,array $columns = ['*'], array $relations=[], array $appends=[]) : ?Model;

    /**
     * create an invoice.
     * @param array $payload
     * @return Model
     */
    public function create(array $payload) : ?Model;

    /**
     * Update existing model.
     *
     * @param int $id
     * @param array $payload
     * @return bool
     */
    public function update(int $id, array $payload): bool;
}
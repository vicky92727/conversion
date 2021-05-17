<?php

namespace App\Providers;

use App\Repositories\Eloquent\BaseRepository;
use App\Repositories\Eloquent\InvoiceRepository;
use App\Repositories\Eloquent\InvoiceEventRepository;
use App\Repositories\Eloquent\SessionRepository;
use App\Repositories\Eloquent\UserRepository;
use App\Repositories\EloquentRepositoryInterface;
use App\Repositories\InvoiceRepositoryInterface;
use App\Repositories\InvoiceEventRepositoryInterface;
use App\Repositories\SessionRepositoryInterface;
use App\Repositories\UserRepositoryInterface;
use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(EloquentRepositoryInterface::class,BaseRepository::class);
        $this->app->bind(InvoiceRepositoryInterface::class,InvoiceRepository::class);
        $this->app->bind(InvoiceEventRepositoryInterface::class,InvoiceEventRepository::class);
        $this->app->bind(SessionRepositoryInterface::class,SessionRepository::class);
        $this->app->bind(UserRepositoryInterface::class,UserRepository::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\InvoiceRepositoryInterface;
use App\Repositories\UserRepositoryInterface;
use App\Repositories\InvoiceEventRepositoryInterface;
use App\Http\Requests\InvoiceRequest;
use App\Http\Requests\InvoiceGetRequest;
class InvoiceController extends Controller
{
    private $invoiceRepository;
    private $userRepository;
    private $invoiceEventRepository;


    public function __construct(InvoiceRepositoryInterface $invoiceRepository,UserRepositoryInterface $userRepository,InvoiceEventRepositoryInterface $invoiceEventRepository)
    {
        $this->invoiceRepository = $invoiceRepository;
        $this->userRepository = $userRepository;
        $this->invoiceEventRepository = $invoiceEventRepository;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json($this->invoiceRepository->all(),200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(InvoiceRequest $request)
    {
        $request->validated();
        $start_date     = $request->start_date.' 23:59:59';
        $end_date       = $request->end_date.' 23:59:59';
        $customer_id    = $request->customer_id;
        $registered_event_price     =   \Config::get('constants.prices.registration');
        $activation_event_price     =   \Config::get('constants.prices.activation');
        $appointment_event_price    =   \Config::get('constants.prices.appointment');

        $payload = [
            "start_date" => $start_date,
            "end_date" => $end_date,
            "amount" => 0,
            "customer_id" => $customer_id,
        ];
        $response = $this->invoiceRepository->create($payload);
        $invoiceid = $response->id;

        $allUsers = $this->userRepository->getAllUsersByCustomer($customer_id, $start_date, $end_date);
        //return response()->json($allUsers,200); die;
        $total_amount = 0;
        foreach ($allUsers as $key => $user) {
            
            $sessions = $user->sessions;
            $appointment_occurence = 0;
            $activation_occurence = 0;
            $occurence = 0;
            $event_name = "";
            if (!empty($sessions)) {
               foreach ($sessions as $key => $single_session) {
                    $activated_at = $single_session['activated_at'];
                    $appointment_at = $single_session['appointment_at'];
                    if (!is_null($appointment_at) && $appointment_at!="" && $appointment_at!=null) {
                        $appointment_occurence+=1;
                        $occurence = $appointment_occurence;
                    }
                    if (!is_null($activated_at) && $activated_at!="" && $activated_at!=null) {
                        $activation_occurence+=1;
                        $occurence = $activation_occurence;
                    }
                }
            }
            
            if ($activation_occurence >=1) {
                $event_name = "activated";
                $event_amount = $activation_event_price - $registered_event_price;
            }

            if ($appointment_occurence >=1) {
                $event_name = "appointment";
               $event_amount = $appointment_event_price - $registered_event_price;
            }

            if ($activation_occurence == 0 && $appointment_occurence == 0) {
                $event_name = "registered";
                $event_amount = $registered_event_price;
                $occurence = 1;
            }

            $InvoiceEventPayload = [
                "event_name" => $event_name,
                "event_amount" => $event_amount,
                "occurence" => $occurence,
                "user_id" => $user->id,
                "invoice_id" => $invoiceid,
            ];
            $total_amount += $event_amount;
            $this->invoiceEventRepository->create($InvoiceEventPayload);
        }
        $invoicePayload = [
            "amount" => $total_amount
        ];
        $this->invoiceRepository->update($invoiceid,$invoicePayload);
        return response()->json(['invoice_id' => $invoiceid],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(InvoiceGetRequest $request)
    {   
        $id = $request->route()->parameter('id');
        $columns = ['*'];
        $relations= ['events.user'];
        return response()->json($this->invoiceRepository->findById($id,$columns,$relations),200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

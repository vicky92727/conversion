<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class InvoiceTest extends TestCase
{


    /**
     * get invoice test.
     *
     * @return void
     */
    public function testGetInvoice()
    {
        $response = $this->get('/api/invoices/1');

        $response->assertStatus(200);
    }

    /**
     * create Invoice test.
     *
     * @return void
     */
    public function testsInvoicesAreCreatedCorrectly()
    {
        $payload = [
            "start_date" => "2021-03-01",
            "end_date" => "2021-05-01",
            "customer_id" => "1"
        ];

        $assertJson = '[
                        "id" => 1,
                        "start_date" => "2021-03-01 23:59:59",
                        "end_date" => "2021-05-01 23:59:59",
                        "amount" => "3.50",
                        "customer_id" => 1,
                        "created_at" => "2021-05-17T11:07:16.000000Z",
                        "updated_at"=> "2021-05-17T11:07:16.000000Z",
                        "events"=> [
                            [
                                "id" => 1,
                                "event_name" => "appointment",
                                "event_amount" => "3.50",
                                "occurence" => 1,
                                "user_id" => 3,
                                "invoice_id" => 1,
                                "created_at" => "2021-05-17T11:07:16.000000Z",
                                "updated_at" => "2021-05-17T11:07:16.000000Z",
                                "user" => [
                                    "id" => 3,
                                    "name" => "Dr. Rahsaan Bode",
                                    "email" => "elisha.wehner@example.org",
                                    "email_verified_at" => "2021-05-16T11:39:34.000000Z",
                                    "customer_id"=> 1,
                                    "created_at"=> "2021-04-04T19:37:50.000000Z",
                                    "updated_at"=> "2021-05-16T11:39:34.000000Z"
                                ]
                            ]
                        ]
                    ]';
        $this->json('POST', '/api/invoices', $payload)
            ->assertStatus(200);
    }
}

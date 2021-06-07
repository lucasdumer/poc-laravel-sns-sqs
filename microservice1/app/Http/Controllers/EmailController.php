<?php

namespace App\Http\Controllers;

use Aws\Sns\SnsClient;

class EmailController
{
    public function create()
    {
        try {
            $SnsClient = new SnsClient([
                'region' => 'us-east-1',
                'version' => '2010-03-31',
                'endpoint' => 'http://192.168.48.1:4566/',
                'credentials' => [
                    'key'    => "ACCESSKEYID",
                    'secret' => "SECRETACCESSKEY",
                ],
            ]);
            $SnsClient->publish([
                'TopicArn' => 'arn:aws:sns:us-east-1:000000000000:poc-topic-emails',
                'Message' => json_encode(['test' => true])
            ]);
        } catch(\Exception $e) {
            dd($e->getMessage());
        }
    }
}

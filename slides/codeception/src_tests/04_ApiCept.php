<?php

$I = new ApiTester($scenario);
$I->wantTo('view user profile');
$I->haveHttpHeader('Content-Type','application/x-www-form-urlencoded');
$I->sendGET('/api.php');
$I->seeResponseCodeIs(200);
$I->seeResponseIsJson();
$I->seeResponseContainsJson(['id' => 123, 'name' => 'Test User']);

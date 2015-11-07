<?php

$I = new AcceptanceTester($scenario);
$I->wantTo('Check login page');
$I->amOnPage('/submit.php');
$I->see('Login');
$I->fillField('username', 'Varan');
$I->click('Submit');
$I->see('Login Success Varan!');
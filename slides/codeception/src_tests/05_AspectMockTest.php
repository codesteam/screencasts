<?php
use AspectMock\Test as test;

class AspectMockTest extends \Codeception\TestCase\Test {
  public function testVal() {
    test::double('models\User', ['save' => true]);
    $this->assertTrue(models\User::createByName('name'));
  }
}

<?php
use AspectMock\Test as test;

class AspectMockTest extends \Codeception\TestCase\Test {
  public function testVal() {
    $user = test::double('models\User', ['save' => 'mocked save']);
    $this->assertEquals('mocked save', models\User::createByName('name'));
  }
}

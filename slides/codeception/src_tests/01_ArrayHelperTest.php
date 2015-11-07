<?php

class ArrayHelperTest extends \Codeception\TestCase\Test {
  public function testVal() {
    $this->assertEquals('v', helpers\Arr::val('key', ['key' => 'v']));
    $this->assertEquals('v2', helpers\Arr::val('not exist key', ['key' => 'v'], 'v2'));
    $this->assertNull(helpers\Arr::val('not exist key', ['key' => 'v']));
  }
}

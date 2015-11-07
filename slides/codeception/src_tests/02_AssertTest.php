<?php

class AssertTest extends \Codeception\TestCase\Test {
  public function testAssert() {
    $this->assertEquals(1, '1');
    $this->assertNotEquals(1, 2);
    $this->assertGreaterThan(1, 2);
    $this->assertGreaterThanOrEqual(1,1);
    $this->assertLessThan(2,1);
    $this->assertLessThanOrEqual(1,1);
    $this->assertContains('hello', 'I say: hello world!');
    $this->assertNotContains('hello', 'I say: Hello world!');
    $this->assertEmpty(0);
    $this->assertNotEmpty(1);
    $this->assertNull(null);
    $this->assertNotNull(1);
    $this->assertTrue(true);
    $this->assertFalse(false);
  }
}

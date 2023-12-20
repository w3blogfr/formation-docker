<?php declare(strict_types=1);

use PHPUnit\Framework\TestCase;
use MyProject\Email;

final class EmailTest extends TestCase
{
	/**
	 * @covers MyProject\Email::fromString
	 */
    public function testCanBeCreatedFromValidEmail(): void
    {
        $string = 'user@example.com';

        $email = Email::fromString($string);

        $this->assertSame($string, $email->asString());
    }

	/**
	 * @covers MyProject\Email::fromString
	 */
    public function testCannotBeCreatedFromInvalidEmail(): void
    {
        $this->expectException(InvalidArgumentException::class);

        Email::fromString('user@example.com');
    }
}

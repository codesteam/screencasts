<?php
namespace models;

class User
{
    public static function createByName($name)
    {
        $user       = new self;
        $user->name = $name;
        return $user->save();
    }

    public function save()
    {
        throw new \Exception("Error Processing Request");
    }
}
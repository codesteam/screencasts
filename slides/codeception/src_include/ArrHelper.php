<?php
namespace helpers;

class Arr
{
    public static function val($key, $array, $default = null)
    {
        if (array_key_exists($key, $array)) {
            return $array[$key];
        } else {
            return $default;
        }
    }
}
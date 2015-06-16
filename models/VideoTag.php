<?php

namespace app\models;

use yii\db\ActiveRecord;

class VideoTag extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%video_tags}}';
    }
}

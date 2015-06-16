<?php

namespace app\models;

use yii\db\ActiveRecord;

class Video extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%videos}}';
    }

    public function getVideoTags()
    {
        return $this->hasMany(VideoTag::className(), array('video_id' => 'id'));
    }
}

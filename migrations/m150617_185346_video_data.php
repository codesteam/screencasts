<?php

use yii\db\Schema;
use yii\db\Migration;

class m150617_185346_video_data extends Migration
{
    public function up()
    {
        $this->batchInsert(
            'videos',
            ['id', 'name', 'code', 'description'],
            [
                [1, 'Capistrano часть 1', '<iframe width="550" height="315" src="https://www.youtube.com/embed/1qn5KVGB9Xk" frameborder="0" allowfullscreen></iframe>', 'Скринкаст описывающий Capistrano в общих чертах.'],
                [2, 'Capistrano часть 2', '<iframe width="550" height="315" src="https://www.youtube.com/embed/1qn5KVGB9Xk" frameborder="0" allowfullscreen></iframe>', 'Скринкаст описывающий Capistrano на примере деплоя реального приложения.'],
            ]
        );
        $this->batchInsert(
            'video_tags',
            ['video_id', 'tag'],
            [
                [1, 'capistrano'],
                [2, 'capistrano'],
                [2, 'yii 2'],
                [2, 'php'],
            ]
        );
    }

    public function down()
    {
        echo "m150617_185346_video_data cannot be reverted.\n";

        return false;
    }
    
    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }
    
    public function safeDown()
    {
    }
    */
}

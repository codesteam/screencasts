<?php

use yii\db\Schema;
use yii\db\Migration;

class m150616_193431_video extends Migration
{
    public function up()
    {
        $this->createTable('videos', [
            'id'          => Schema::TYPE_PK,
            'name'        => Schema::TYPE_STRING . ' NOT NULL',
            'code'        => Schema::TYPE_STRING . ' NOT NULL',
            'description' => Schema::TYPE_TEXT  . ' NOT NULL',
        ]);
        $this->createTable('video_tags', [
            'video_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'tag'      => Schema::TYPE_STRING  . ' NOT NULL',
        ]);
        $this->addForeignKey('fk_video_tags_videos', 'video_tags', 'video_id', 'videos', 'id', 'CASCADE', 'CASCADE');
    }

    public function down()
    {
        echo "m150616_193431_video cannot be reverted.\n";

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

<?php

use yii\db\Schema;
use yii\db\Migration;

class m150722_045936_video_details extends Migration
{
    public function up()
    {
        $this->addColumn('videos', 'slides', Schema::TYPE_STRING);
        $this->addColumn('videos', 'source', Schema::TYPE_STRING);
    }

    public function down()
    {
        echo "m150722_045936_video_details cannot be reverted.\n";

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

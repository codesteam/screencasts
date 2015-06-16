<?php
/* @var $this yii\web\View */
$this->title = 'My Yii Application';
?>
<div class="site-index">
    <div class="jumbotron">
        <h1>WEBDEV-скринкасты</h1>
        <p class="lead">Мы учим полезным скиллам.</p>
    </div>
    <div class="body-content">
        <div class="row">
            <? foreach ($videos as $video) :?>
                <div class="col-lg-6">
                    <h2><?=$video->name?></h2>
                    <?=$video->code?>
                    <p><?=$video->description?></p>
                    <? foreach ($video->videoTags as $videoTag) :?>
                        <span class="label label-success"><?=$videoTag->tag?></span>
                    <? endforeach ?>
                </div>
            <? endforeach ?>
        </div>
    </div>
</div>

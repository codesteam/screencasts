<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\Video;

class SiteController extends Controller
{
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
        $data = [
            'videos' => Video::find()->all(),
        ];
        return $this->render('index', $data);
    }
}

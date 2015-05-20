<?php
namespace Multiple\Frontend\Controllers;

use Events;
use Pages;
use RatesGenerator;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;

class RatesController extends ControllerBase {

    public function runAction($conditionId, $dateStart, $dateEnd) {
        $events = Events::find(array(
            "date >= :dateStart: AND date <= :dateEnd:",
            'bind' => array(
                "dateStart" => $dateStart,
                "dateEnd" => $dateEnd
            )
        ));

        RatesGenerator::run($conditionId, $events);
        return $this->response->redirect('/results/run/'.$conditionId);
    }

}


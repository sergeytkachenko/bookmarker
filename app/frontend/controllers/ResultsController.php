<?php
namespace Multiple\Frontend\Controllers;

use Pages;
use RatesGenerator;
use RecommendedArticle;
use Results;
use ServiceItem;
use Services;
use Slider;

class ResultsController extends ControllerBase {

    public function runAction($conditionId) {
       debug(Results::showResult($conditionId));
    }
    
}


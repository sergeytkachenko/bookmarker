<?php

use Rates;

abstract class RatesGenerator {

    // Генерация по месяцу
    static public function run ($conditionId, $events) {
        $condition = Conditions::findFirst($conditionId);
        Rates::find(array(
            "condition_id = :conditionId:",
            "bind" => array(
                'conditionId' => $conditionId
            )
        ))->delete();
        foreach($events as $event) {
            $conditionText = str_replace(array_keys($event->toArray()), array_values($event->toArray()), $condition->condition);
            if (self::condition($conditionText)) {
                $rate = new Rates();
                $rate->save(array(
                    "condition_id" => $conditionId,
                    "event_id" => $event->id,
                    "sum_home" => $condition->sum_home,
                    "sum_guest" => $condition->sum_guest,
                    "sum_draw" => $condition->sum_draw,
                ));
            }
        }
    }

    static private function condition ($condition) {
        $result = 0;
        eval('$result = '.$condition.";");
        return $result;
    }
}
<?

abstract class Results {

    static public function showResult ($conditionId, $bank = 100) {
        $rates = Rates::find(array(
            "condition_id = :conditionId:",
            "bind" => array(
                'conditionId' => $conditionId
            )
        ));
        $sum = 0;
        foreach($rates as $rate) {
            $event = Events::findFirst(array(
                "id = :id:",
                "bind" => array(
                    "id" => $rate->event_id
                )
            ));

            if($event->is_win_a) {
                $sum += $bank * ($rate->sum_home / 100 * $event->c_win_a);
            }
            if($event->is_win_b) {
                $sum += $bank * ($rate->sum_guest / 100 * $event->c_win_b);
            }
            if($event->is_draw) {
                $sum += $bank * ($rate->sum_draw / 100 * $event->c_draw);
            }
        }

        return  array(
            'выиграш' => $sum - (count($rates) * $bank),
            'необходимая сумма' => count($rates) * $bank,
            'condition' => Conditions::findFirst($conditionId)->condition
        );
    }
}
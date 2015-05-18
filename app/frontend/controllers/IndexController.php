<?php
namespace Multiple\Frontend\Controllers;

use Pages;
use RecommendedArticle;
use ServiceItem;
use Services;
use Slider;

class IndexController extends ControllerBase {
    public function indexAction() {
        $folder = PUBLIC_PATH."/json-data/";
        foreach (scandir($folder) as $path ) {
            $date = preg_replace("/^([0-9]+)\\.json$/", "$1", $path);

            if(preg_match("/\\.json$/", $path)) {
                $date = substr($date, 0, 4)."-".substr($date, 4, 2)."-".substr($date, 6, 2);

                $json = json_decode(file_get_contents($folder.$path));
                foreach($json as $tourName => $dataList) {
                    $tournament = \Tournaments::findFirst(array(
                        "title = :title:",
                        "bind" => array(
                            "title" => $tourName
                        )
                    ));
                    if(!$tournament) {
                        $tournament = new \Tournaments();
                        $tournament->save(array(
                            "title" => $tourName
                        ));
                    }

                    foreach ($dataList as $data) {
                        $result = $this->getResult($data->result);
                        if(count($result) !== 2) {
                           continue;
                        }
                        $properties = get_object_vars($data);
                        if(count($properties) < 6) {continue;}

                        $teamA = \Teams::findFirst(array(
                            "title = :title:",
                            "bind" => array(
                                "title" => $data->nameOne
                            )
                        ));
                        if(!$teamA) {
                            $teamA = new \Teams();
                            $teamA->save(array(
                                "title" => $data->nameOne
                            ));
                        }
                        $teamB = \Teams::findFirst(array(
                            "title = :title:",
                            "bind" => array(
                                "title" => $data->nameTwo
                            )
                        ));
                        if(!$teamB) {
                            $teamB = new \Teams();
                            $teamB->save(array(
                                "title" => $data->nameTwo
                            ));
                        }

                        $event = new \Events();
                        $saved = $event->save(array(
                            'tournament_id' => $tournament->id,
                            "team_a_id" => $teamA->id,
                            "team_b_id" => $teamB->id,
                            "c_win_a" => @$properties['1'],
                            "c_win_b" => @$properties['2'],
                            "c_draw" => @$properties['X'],
                            'count_goals_a' => $result[0],
                            'count_goals_b' => $result[1],
                            'is_win_a' => ($result[0] > $result[1])? 1 : 0,
                            'is_win_b' => ($result[1] > $result[0])? 1 : 0,
                            'is_draw' => ($result[0] == $result[1])? 1 : 0,
                            'date' => $date
                        ));

                        if(!$saved) {
                            debug($event->getMessages(), $data);
                        }
                    }
                }
            }
        }
    }

    private function getResult ($resultString) {
        $resultString =  preg_replace("/^([0-9]+:[0-9]+).*/", "$1", $resultString);
        return explode(":", $resultString);
    }
}


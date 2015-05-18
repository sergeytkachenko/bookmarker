<?php

class Events extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $tournament_id;

    /**
     *
     * @var integer
     */
    public $team_a_id;

    /**
     *
     * @var integer
     */
    public $team_b_id;

    /**
     *
     * @var string
     */
    public $c_win_a;

    /**
     *
     * @var string
     */
    public $c_win_b;

    /**
     *
     * @var string
     */
    public $c_draw;

    /**
     *
     * @var integer
     */
    public $is_win_a;

    /**
     *
     * @var integer
     */
    public $is_win_b;

    /**
     *
     * @var integer
     */
    public $is_draw;

    /**
     *
     * @var integer
     */
    public $count_goals_a;

    /**
     *
     * @var integer
     */
    public $count_goals_b;

    /**
     *
     * @var string
     */
    public $date;
    public function initialize()
    {
        $this->belongsTo('tournament_id', 'Tournaments', 'id', array('alias' => 'Tournaments'));
        $this->belongsTo('team_a_id', 'Teams', 'id', array('alias' => 'TeamsA'));
        $this->belongsTo('team_b_id', 'Teams', 'id', array('alias' => 'TeamsB'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'tournament_id' => 'tournament_id', 
            'team_a_id' => 'team_a_id', 
            'team_b_id' => 'team_b_id', 
            'c_win_a' => 'c_win_a', 
            'c_win_b' => 'c_win_b', 
            'c_draw' => 'c_draw', 
            'is_win_a' => 'is_win_a', 
            'is_win_b' => 'is_win_b', 
            'is_draw' => 'is_draw', 
            'count_goals_a' => 'count_goals_a', 
            'count_goals_b' => 'count_goals_b', 
            'date' => 'date'
        );
    }

}

<?php

class Rates extends \Phalcon\Mvc\Model
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
    public $condition_id;

    /**
     *
     * @var integer
     */
    public $event_id;

    /**
     *
     * @var string
     */
    public $sum_home;

    /**
     *
     * @var string
     */
    public $sum_guest;

    /**
     *
     * @var string
     */
    public $sum_draw;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('event_id', 'Events', 'id', array('alias' => 'Events'));
        $this->belongsTo('condition_id', 'Conditions', 'id', array('alias' => 'Conditions'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'condition_id' => 'condition_id', 
            'event_id' => 'event_id', 
            'sum_home' => 'sum_home', 
            'sum_guest' => 'sum_guest', 
            'sum_draw' => 'sum_draw'
        );
    }

}

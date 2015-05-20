<?php

class Conditions extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $condition;

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
    public function initialize()
    {
        $this->hasMany('id', 'Rates', 'condition_id', array('alias' => 'Rates'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'condition' => 'condition', 
            'sum_home' => 'sum_home', 
            'sum_guest' => 'sum_guest', 
            'sum_draw' => 'sum_draw'
        );
    }

}

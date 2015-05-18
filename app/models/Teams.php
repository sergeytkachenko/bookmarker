<?php

class Teams extends \Phalcon\Mvc\Model
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
    public $title;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Events', 'team_a_id', array('alias' => 'Events'));
        $this->hasMany('id', 'Events', 'team_b_id', array('alias' => 'Events'));
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'title' => 'title'
        );
    }

}

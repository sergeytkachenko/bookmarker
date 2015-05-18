<?
class MenuHelper {

    static public $categoryUrl = "/service-item/list/";

    /**
     * Строим дерево для подменю
     * @param $tree
     * @param $parent
     * @return array
     */
    static public function formatTree($tree, $parent){
        $tree2 = array();
        foreach($tree as $i => $item){
            $item['url'] = self::$categoryUrl.$item['id'];
            if($item['parent_id'] == $parent){
                $tree2[$item['id']] = $item;
                $tree2[$item['id']]['submenu'] = self::formatTree($tree, $item['id']);
            }
        }

        return $tree2;
    }

    public static function menuLeft ($data, $first=true) {
        if (empty($data)) {
            return '';
        }
        $style = $first? "display:block" : "";
        $out = '<ul class="dropdown-menu" style="'.$style.'"> ';
        foreach ($data as $name => $children) {
            $dropDown = self::menuLeft($children['submenu'], false);
            $class = $dropDown? "list-group-item clearfix dropdown" : "";
            $li = '<li class="'.$class.'">';
            $dropDownI = $dropDown? '<i class="fa fa-angle-down"></i>' : '';
            $url = $class? "javascript:void(0)" : $children['url'];
            $a = '<a href="'.$url.'"><i class="fa fa-circle"></i>'.$children['title'].$dropDownI.'</a>';
            $out .= $li. $a . $dropDown . '</li>';
        }
        $out .= '</ul>';
        return $out;
    }

    public static function menuLeftCollapse ($data, $first=false) {
        return self::menuLeft($data, $first);
    }

}


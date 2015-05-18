<?php
namespace Multiple\Admin\Controllers;
use News;

class NewsController extends ControllerBase {

    public $model = News::class;

    public function saveAction($id=null) {
        $this->setJson();
        $id = $this->request->get('id');

        if (!isset($id)) {
            throw new Exception('Id is required');
        }

        $data = $this->request->getPost();
        unset($data['id']);
        $data['date_create'] = date("Y-m-d H:i:s");
        if($id == "new") {
            $item = new News();
            $item->assign($data);
            $item->save();
        } else {
            $item = News::findFirst($id);
            $item->save($data);
        }

        return array(
            "success" => true,
            "errors" => $item->getMessages(),
            "data" => $data
        );
    }

}


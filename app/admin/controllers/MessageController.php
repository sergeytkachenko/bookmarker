<?php
namespace Multiple\Admin\Controllers;
use Messages;

class MessageController extends ControllerBase {
    public $model = Messages::class;

    public function saveAction($id=null) {
        $this->setJson();
        $data = $this->request->getPost();

        $msg = Messages::findFirst($id);
        $msg->is_answered = 1;
        $msg->save();

        $mgs = new Messages();
        $success = $mgs -> save(array(
            'user_sender_id' => $this->session->get('user')->id,
            'user_recipient_id' => $data['user_sender_id'],
            'subject' => 'Ответ::'.$data['subject'],
            'text' => $data['answer'],
            'date' => date("Y-m-d H:i:s")
        ));

        return array(
            "success" => $success,
            "data" => $data,
            'errors' => $mgs->getMessages()
        );
    }

    public function getListAction() {
        $this->setJson();
        $data = Messages::find("user_sender_id != ".$this->session->get('user') -> id);
        return array(
            'data' => $data->toArray(),
            'totalCount' => count($data->toArray()),
        );
    }
}


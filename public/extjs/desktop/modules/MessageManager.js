Ext.define('MyDesktop.MessageManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'message-manager',
        
    init : function(){
        var self = this;
        
        this.launcher = {
            text: 'Message',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;

        Ext.define('Message', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'user_sender_id', type: 'int'},
                {name: 'user_recipient_id', type: 'int'},
                'subject', 'text',
                {name: 'date', type: 'date'},
                {name: 'is_unread', type: 'bool'},
                {name: 'is_answered', type: 'bool'}
            ],
            idProperty: 'id'
        });

        new countItem().get(self);
    },

    createWindow : function(){ 
        
        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);
        var self = this;   
        
        if(!win) {
        
            // create the Data Store
            this.store = Ext.create('Ext.data.Store', {
                model: 'Message',
                proxy: {
                    type: 'ajax',
                    url: '/admin/message/getList',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    }
                },
                listeners: {
                    "load": function(){
                        self.itemStore.load();
                    }
                }
            });
            
            var store = this.store;
            
            this.grid = Ext.create('Ext.grid.Panel', {
                
                border: false,
                xtype: 'grid',
                store: store,
                loadMask: true,
                columns:[{
                    text: "Id",
                    dataIndex: 'id',
                    width: 30,
                    sortable: true
                },{
                    text: "Тема",
                    dataIndex: 'subject',
                    width: 150,
                    sortable: true,
                    flex: true
                },{
                    text: "Дата",
                    dataIndex: 'date',
                    width: 150,
                    sortable: true,
                    renderer: Ext.util.Format.dateRenderer('d.m.Y')
                },{
                    text: 'Отвечено',
                    dataIndex: 'is_answered',
                    trueText: "&radic;",
                    falseText: "",
                    xtype: 'booleancolumn',
                    width: 100,
                    align: 'center',
                    sortable: true
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Обратная связь' ,
                width: 750,
                height: 480,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    this.grid
                ],
                tbar:[{
                    iconCls: 'icon-add',
                    text: 'Удалить',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        this.onDeleteClick(selection.raw.id);
                    }
                }, "-", {
                    iconCls: 'icon-add',
                    text: 'Просмотреть / Ответить',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (!selection) return;
                        self.answerMessageForm(selection.raw.id, selection.raw);
                    }
                }]
            });
            
            store.load();
        }
        win.show();

        return win;
    },
    
    onDeleteClick: function(id){
        var self = this;
        Ext.MessageBox.confirm('Confirm', 'Удалить?', function(btn) {
            if (btn != 'yes') return;
            Ext.Ajax.request({
                url: '/admin/message/remove/' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },

    answerMessageForm : function(id, data){
        var desktop = this.app.getDesktop();
        var winId = 'answerMessage-manager-answerMessage-form-' + id;
        var win = desktop.getWindow(winId);
               
        var self = this;
        
        if(!win){
          this.form = Ext.widget('form', {
                arget: true,
                layout: {
                    type: 'anchor',
                    align: 'stretch'
                },
                autoScroll: true,
                border: false,
                bodyPadding: 15,

                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 95,
                    msgTarget: 'side',
                    anchor:'100%'
                },
                
                reader : Ext.create('Ext.data.reader.Json', {
                    model: 'Message'
                }),

                items: [{
                    xtype: 'textfield',
                    name: 'id',
                    hidden: true
                },{
                    xtype: 'textfield',
                    name: 'user_recipient_id',
                    hidden: true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'ID отправителя',
                    name: 'user_sender_id',
                    disabled: true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Тема',
                    name: 'subject',
                    disabled: true
                },{
                    xtype: 'textarea',
                    fieldLabel: 'Что написали',
                    name: 'text',
                    height: 150
                },{
                    xtype: 'textarea',
                    fieldLabel: 'Ответить',
                    name: 'answer',
                    height: 200,
                    allowBlank: false
                }
            ],

                buttons: [{
                    text: 'Ответить',
                    formBind: true,
                    handler: function(){
                        this.up('form').getForm().submit({
                            url: '/admin/message/save/'+id,
                            params : {
                                user_sender_id : data.user_sender_id,
                                subject : data.subject
                            },
                            submitEmptyText: false,
                            waitMsg: 'Отправление...',
                            success: function(form, action) {
                                Ext.Msg.alert('Сообщение', 'Сообщение отправлено!');
                                win.close();
                                self.store.load();
                            }
                        });
                    }
                }]
            });
            
            var form = this.form;
            
            var title = "Отправка сообщения";
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : '80%',
                height : 600,
                iconCls: 'icon-form',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    form
                ]
            });
            
            form.getForm().load({
                url: '/admin/message/getOne',
                params : {
                    'id' : id
                }
            });

        }
        win.show();
    }
});


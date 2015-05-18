Ext.define('MyDesktop.CommentsManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'comments-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Comments',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;

        Ext.define('Comments', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'service_item_id', type: 'int'},
                'user_name','email', 'comment',
                {name: 'date_comment', type: 'date'}

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
                model: 'Comments',
                proxy: {
                    type: 'ajax',
                    url: '/admin/comments/getList',
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

            this.serviceItemStore = Ext.create('Ext.data.Store', {
                fields: [{name: 'id', type: 'int'}, 'title'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/service-item/getList',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    }
                }
            }).load();
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
                    text: "Имя",
                    dataIndex: 'user_name',
                    width: 150,
                    sortable: true
                },{
                    text: "Email",
                    dataIndex: 'email',
                    width: 200,
                    sortable: true
                },{
                    text: "Обьявление",
                    dataIndex: 'service_item_id',
                    flex : true,
                    sortable: true,
                    renderer : function (val) {
                        var title = val;
                        Ext.Array.each(self.serviceItemStore.getRange(), function (r) {
                            if (val == r.data.id) {
                                title = r.data.title;
                            }
                        });
                        return title;
                    }
                },{
                    text: "Просмотр",
                    dataIndex: 'service_item_id',
                    width: 120,
                    renderer: function(value){
                        var myURL = '';
                        if(value !== ''){
                            myURL = '<a href="/service-item/view/' + value + '" target="_blank">просмотр</a>';
                        }
                        return myURL;
                    }
                },{
                    text: "Дата",
                    dataIndex: 'date_comment',
                    width: 150,
                    sortable: true,
                    renderer: Ext.util.Format.dateRenderer('d.m.Y H:i:s')
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Комментарии обьявления' ,
                width: 900,
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
                    text: 'Редактировать',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];

                        if (!selection) return;

                        this.createForm(selection.raw.id, selection.raw);
                    }
                },"-",{
                    iconCls: 'icon-add',
                    text: 'Удалить',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];

                        if (!selection) return;

                        this.onDeleteClick(selection.raw.id);
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
                url: '/admin/comments/remove/' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },
    
    createForm : function(id, data){
       
        var desktop = this.app.getDesktop();
        var winId = 'comments-manager-comments-form-' + id;
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
                    model: 'Comments'
                }),

                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled : true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Имя',
                    name: 'user_name'
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Email',
                    name: 'email'
                },{
                    xtype: 'textarea',
                    fieldLabel: 'Комментарий',
                    name: 'comment'
                },{
                    xtype: 'datefield',
                    fieldLabel: 'Дата',
                    name: 'date_comment',
                    format: 'd.m.Y H:i:s',
                    submitFormat: 'Y-m-d H:i:s',
                    value: Ext.util.Format.date(data.date, 'd.m.Y H:i:s')
                }
            ],

                buttons: [{
                    text: 'Сохранить',
                    formBind: true,
                    handler: function(){
                        this.up('form').getForm().submit({
                            url: '/admin/comments/save/'+id,
                            submitEmptyText: false,
                            waitMsg: 'Сохранение...',
                            success: function(form, action) {
                                win.close();
                                self.store.load();
                            }
                        });
                    }
                }]
            });
            
            var form = this.form;
            
            var title = (id == 'new' 
                ? 'Новый '
                : 'Редактирование ');
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : 800,
                height : 600,
                iconCls: 'icon-form',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    form
                ]
            });
            
            if (id != 'new') {
                form.getForm().load({
                    url: '/admin/comments/getOne',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    }
});


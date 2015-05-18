Ext.define('MyDesktop.TopMenuManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'top-menu-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'TopMenu',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;
  
        Ext.define('TopMenu', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                'title', 'url',
                {name : 'position', type : "int"}
            ],
            idProperty: 'id'
        });

    },

    createWindow : function(){ // открытие списка событий 
        
        var desktop = this.app.getDesktop();
        var id = this.id;
        var win = desktop.getWindow(id);

        var self = this;
       
        if(!win) {
        
            // create the Data Store
            this.store = Ext.create('Ext.data.Store', {
                model : "TopMenu",
                proxy: {
                    type: 'ajax',
                    url: '/admin/top-menu/getList.json',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
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
                    text: "title",
                    dataIndex: 'title',
                    flex : true,
                    sortable: true
                },{
                    text: "url",
                    dataIndex: 'url',
                    flex : true,
                    sortable: true
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Верхнее Меню',
                width: 800,
                height: 600,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    this.grid
                ],
                tbar:[ {
                    iconCls: 'icon-add',
                    text: 'Редактирование',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];

                        if (!selection) return;

                        this.createForm(selection.raw.id, selection.raw);
                    }
                }]
            });
            
            store.load();
        }
        
        win.show(null, function() {windowShow(self)});

        
        return win;
    },

    createForm : function(id, data){
       
        var desktop = this.app.getDesktop();
        var winId = 'top-menu-manager-top-menu-form-' + id;
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
                bodyPadding: 10,

                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 95,
                    msgTarget: 'side',
                    anchor:'100%'
                },
                
                reader : Ext.create('Ext.data.reader.Json', {
                    model: 'TopMenu'
                }),

                items: [{
                    xtype: 'textfield',
                    fieldLabel: 'Id',
                    name: 'id',
                    disabled: true
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Title *',
                    name: 'title',
                    allowBlank: false
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Url *',
                    name: 'url',
                    allowBlank: false
                }
            ],

                buttons: [{
                    text: 'Сохранить',
                    formBind: true,
                    handler: function(){
                        this.up('form').getForm().submit({
                            params: {
                                'id' : id
                            },
                            url: '/admin/top-menu/save.json',
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
            
            var title = 'Редактирование';
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : "70%",
                height : 650,
                iconCls: 'icon-form',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    form
                ]
            });
            
            if (id != 'new') {
                var f = form.getForm().load({
                    url: '/admin/top-menu/getOne.json',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    }
});


Ext.define('MyDesktop.BonusManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'bonus-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Bonus',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;
  
        Ext.define('Bonus', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                'title', 'description',
                'short_description', 
                'meta_keywords',
                'meta_description',
                {name: 'date_start', type: 'date'},
                {name: 'date_end', type: 'date'},
                {name: 'visible', type: 'bool'}
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
                model : "Bonus",
                proxy: {
                    type: 'ajax',
                    url: '/admin/bonus/get-list.json',
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
                    width: 200,
                    sortable: true
                },{
                    text: "Дата Начала",
                    dataIndex: 'date_start',
                    width: 130,
                    sortable: true,
                    renderer: Ext.util.Format.dateRenderer('d.m.Y')
                },{
                    text: "Дата Окончания",
                    dataIndex: 'date_end',
                    width: 130,
                    sortable: true,
                    renderer: Ext.util.Format.dateRenderer('d.m.Y')
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Бонусы и акции',
                width: 520,
                height: 600,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    this.grid
                ],
                tbar:[{
                    iconCls: 'icon-add',
                    text: 'Добавить акцию',
                    scope: this,
                    handler: function() {
                        
                        this.createForm("new");
                    }
                }, '-', {
                    iconCls: 'icon-add',
                    text: 'Редактирование акции',
                    scope: this,
                    handler: function() {
                        var selection = grid.getView().getSelectionModel().getSelection()[0];

                        if (!selection) return;

                        this.createForm(selection.raw.id, selection.raw);
                    }
                },{
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
        
        win.show(null, function() {windowShow(self)});

        
        return win;
    },
    
    onDeleteClick: function(id){
        var self = this;
        
        Ext.MessageBox.confirm('Confirm', 'Удалить выбраную запись?', function(btn) {
            if (btn != 'yes') return;

            Ext.Ajax.request({
                url: '/admin/bonus/remove.json?id=' + id,
                success: function() {
                    self.store.load();
                }
            });
        });
    },
    
    createForm : function(id, data){
        var ndate = new Date();
        ndate = ndate.getFullYear() + "-" + ndate.getMonth() + "-" + ndate.getDay();
        
        var date_start = (undefined !== data)? data.date_start : ndate,
        date_end = (undefined !== data)? data.date_end : ndate,
        visible = (undefined !== data && data.visible == 1)? true : false;
       
        var desktop = this.app.getDesktop();
        var winId = 'bonus-manager-Bonus-form-' + id;
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
                    model: 'Bonus'
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
                    xtype: 'tinymcefield',
                    name: 'short_description',
                    fieldLabel: 'Короткое описание',
                    height: 200,
                    tinymceConfig: {
                        theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,preview,|,forecolor,backcolor",
                        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,media,advhr,|,print,|,insertfile,insertimage",
                        theme_advanced_buttons4: '',
                        skin: 'o2k7',
                        file_browser_callback : 'myFileBrowser',
                        remove_script_host : false,
                        convert_urls : false,
                        init_instance_callback : "showEditor"
                    }
                },{
                    xtype: 'tinymcefield',
                    name: 'description',
                    fieldLabel: 'Полное описание',
                    height: 300,
                    tinymceConfig: {
                        theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,preview,|,forecolor,backcolor",
                        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,media,advhr,|,print,|,insertfile,insertimage",
                        theme_advanced_buttons4: '',
                        skin: 'o2k7',
                        file_browser_callback : 'myFileBrowser',
                        remove_script_host : false,
                        convert_urls : false,
                        init_instance_callback : "showEditor"
                    }
                },{
                    xtype: 'datefield',
                    fieldLabel: 'Дата Начала',
                    name : 'date_start',
                    format: 'd.m.Y',
                    submitFormat: 'Y-m-d',
                    value: Ext.util.Format.date(date_start, 'd.m.Y')
                },{
                    xtype: 'datefield',
                    fieldLabel: 'Дата окончания',
                    name : 'date_end',
                    format: 'd.m.Y',
                    submitFormat: 'Y-m-d',
                    value: Ext.util.Format.date(date_end, 'd.m.Y')
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Meta Keywords',
                    name: 'meta_keywords'
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Meta Description',
                    name: 'meta_description'
                },{
                    xtype: 'checkboxfield',
                    fieldLabel: 'Видна',
                    name: 'visible',
                    inputValue: "1",
                    uncheckedValue: "0",
                    checked: visible
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
                            url: '/admin/bonus/save.json',
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
            
            var title = 'Редактирование Акций';
            
            win = desktop.createWindow({
                id: winId,
                title: title,
                width : 800,
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
                    url: '/admin/bonus/get-one.json',
                    params : {
                        'id' : id
                    }
                });
            }
        }
        win.show();
    }
});


Ext.define('MyDesktop.OrdersManager', {
    extend: 'Ext.ux.desktop.Module',

    id:'orders-manager',
        
    init : function(){
  
        var self = this;
        
        this.launcher = {
            text: 'Orders',
            iconCls: 'icon-grid',
            handler : this.createWindow,
            scope : this
        };
        
        this.grid = null;
        this.store = null;
        this.urlImage = null;
  
        Ext.define('Orders', {
            extend: 'Ext.data.Model',
            fields: [
                {name: 'id', type: 'int'},
                {name: 'user_id', type: 'string'},
                'sum',
                {name : 'date', type : "date"}
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
                model : "Orders",
                proxy: {
                    type: 'ajax',
                    url: '/admin/orders/getList.json',
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'totalCount'
                    }
                }
            });
            this.usersStore = Ext.create('Ext.data.Store', {
                fields: [{name: 'id', type: 'int'}, 'email'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/users/getList',
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
                    text: "Пользователь",
                    dataIndex: 'user_id',
                    flex : true,
                    sortable: true,
                    renderer : function (val) {
                        var email = val;
                        Ext.Array.each(self.usersStore.getRange(), function (r) {
                            if (val == r.data.id) {
                                email = r.data.email;
                            }
                        });
                        return email;
                    }
                },{
                    text: "Сума",
                    dataIndex: 'sum',
                    sortable: true,
                    width: 170
                },{
                    text: "Дата",
                    dataIndex: 'date',
                    width: 170,
                    sortable: true,
                    renderer: Ext.util.Format.dateRenderer('d.m.Y H:i:s')
                }]
            });
            
            var grid = this.grid;
        
            win = desktop.createWindow({
                id: id,
                title:'Пополнения счетов',
                width: 800,
                height: 600,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    this.grid
                ]
            });
            
            store.load();
        }
        win.show(null, function() {windowShow(self)});
        return win;
    }
});


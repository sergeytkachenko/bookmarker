<!-- BEGIN HEADER -->
<div role="navigation" class="navbar header no-margin">
    <div class="container">
        <div class="navbar-header">
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <a href="/" class="navbar-brand">
                <img src="/img/logo.png" alt="Logo" style="position: relative; top: -20px;">
            </a><!-- LOGO -->
        </div>
        <!-- BEGIN CART -->
        <div class="cart-block">
            <div class="cart-info">
                <a href="<?php if ($user) { ?>/room/add <?php } else { ?> /user/login<?php } ?>">Разместить объявление</a>
            </div>
            <i class="fa fa-tag"></i>
        </div>
        <!-- END CART -->
        <!-- BEGIN NAVIGATION -->
        <div class="collapse navbar-collapse mega-menu">
            <ul class="nav navbar-nav">
                <?php foreach ($menuList as $menu) { ?>
                    <li>
                        <a class="dropdown-toggle" href="<?php echo $menu->url; ?>">
                            <?php echo $menu->title; ?>
                        </a>
                    </li>
                <?php } ?>
                
                    
                        
                        
                    
                    
                        
                            
                        
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                <!-- BEGIN TOP SEARCH -->
                <li class="menu-search">
                    <span class="sep"></span>
                    <i class="fa fa-search search-btn"></i>
                    <div class="search-box">
                        <form action="#">
                            <div class="input-group">
                                <input type="text" placeholder="Что искать?" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">Поиск</button>
                                    </span>
                            </div>
                        </form>
                    </div>
                </li>
                <!-- END TOP SEARCH -->
            </ul>
        </div>
        <!-- END NAVIGATION -->
    </div>
</div>
<!-- END HEADER -->



    <!-- BEGIN SIDEBAR -->
    <div class="sidebar col-md-3 col-sm-5">
        <ul class="list-group margin-bottom-25 sidebar-menu">
            <li class="list-group-item clearfix dropdown active">
                <a href="javascript:void(0);" class="collapsed">
                    <i class="fa fa-angle-right"></i>
                    Рубрики
                    <i class="fa fa-angle-down"></i>
                </a>
                <?php echo \MenuHelper::menuLeft($categoriesTree); ?>
            </li>
            <li class="list-group-item clearfix dropdown ">
                <a href="javascript:void(0);">
                    <i class="fa fa-angle-right"></i>
                    Услуги
                    <i class="fa fa-angle-down"></i>
                </a>
                <?php echo \MenuHelper::menuLeftCollapse($servicesTree); ?>
            </li>
        </ul>
        <!--            <div class="sidebar-filter margin-bottom-25">-->
        <!--                <h2>Filter</h2>-->
        <!--                <h3>Availability</h3>-->
        <!--                <div class="checkbox-list">-->
        <!--                    <label><input type="checkbox"> Not Available (3)</label>-->
        <!--                    <label><input type="checkbox"> In Stock (26)</label>-->
        <!--                </div>-->
        <!---->
        <!--                <h3>Price</h3>-->
        <!--                <p>-->
        <!--                    <label for="amount">Range:</label>-->
        <!--                    <input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;">-->
        <!--                </p>-->
        <!--                <div id="slider-range"></div>-->
        <!--            </div>-->

        <div class="clearfix"> </div>
        <?php foreach ($leftBanners as $banner) { ?>
            <div class="banner">
                <a href="<?php echo $banner->url; ?>" title="<?php echo $banner->title; ?>"> <img src="<?php echo $banner->img_src; ?>" /></a>
            </div>
        <?php } ?>
    </div>
    <!-- END SIDEBAR -->
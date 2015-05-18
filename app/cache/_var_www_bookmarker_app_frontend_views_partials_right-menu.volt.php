
<div class="col-md-2 col-sm-2">

    <div id="myCarousel" class="carousel slide clearfix journal" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <a href="javascript:void(0);">
                    <img src="/img/j2.jpg" alt="" />
                </a>
            </div>
            <div class="item">
                <a href="javascript:void(0);" >
                    <img src="/img/j1.jpg" alt="" />
                </a>
            </div>
            <div class="item">
                <a href="javascript:void(0);">
                    <img src="/img/j3.jpg" alt="" />
                </a>
            </div>
        </div>
    </div>
    <div id="calendar" />

    <?php foreach ($rightBanners as $banner) { ?>
        <div class="banner">
            <a href="<?php echo $banner->url; ?>" title="<?php echo $banner->title; ?>"> <img src="<?php echo $banner->img_src; ?>" /></a>
        </div>
    <?php } ?>
</div>
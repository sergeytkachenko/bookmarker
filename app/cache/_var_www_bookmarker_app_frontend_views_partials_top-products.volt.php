<?php if ($this->length($topProducts) > 2) { ?> <!-- no display if < 3 -->
<h2>Топ предложений</h2>
<div class="bxslider-wrapper">
    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="4" data-slide-margin="15">
        <?php foreach ($topProducts as $serviceItem) { ?>
        <li>
            <div class="product-item">
                <div class="pi-img-wrapper">
                    <?php $images = $serviceItem->ServiceItemImages->toArray(); ?>
                    <?php if ($this->length($images) > 0) { ?>
                        <?php $src = $images[0]['img_src']; ?>
                    <?php } else { ?>
                        <?php $src = '/img/b1.jpg'; ?>
                    <?php } ?>
                    <a href="/service-item/view/<?php echo $serviceItem->id; ?>"><img src="/public/timthumb.php?w=128&h=171&src=<?php echo $src; ?>" class="img-responsive" alt=""></a>
                </div>
                <h3><a href="item.html"><?php echo $serviceItem->title; ?></a></h3>
            </div>
            <?php if ((strtotime(date('Y-m-d')) - strtotime($serviceItem->date_post)) / (24 * 3600) < 3) { ?>
                <div class="sticker sticker-new"></div>
            <?php } ?>
        </li>
        <?php } ?>
    </ul>
</div>
<?php } ?>
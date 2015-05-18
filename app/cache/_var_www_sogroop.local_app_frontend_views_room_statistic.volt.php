<div class="row list-view-sorting clearfix">
    <!-- BEGIN PRODUCT LIST -->
    <div class="row product-list">
        <?php foreach ($items as $item) { ?>
            <!-- PRODUCT ITEM START -->
            <div class="col-md-12" id="item-<?php echo $item->id; ?>">
                <div class="product-item <?php if ($item->is_vip) { ?> vip <?php } ?>">
                    <div class="control" style="padding-bottom: 10px; margin-bottom: 5px;padding-left: 6px; text-align: right; overflow: hidden; border-bottom: 1px dashed #bbb">
                        <button type="button" class="btn default count-visits" title="Просмотров за последние 24 часа ">
                            <strong><?php echo \Statistics::countVisits($item->id,1); ?></strong> - <small>за 24 часа</small>
                        </button>
                        <button type="button" class="btn default count-visits" title="Просмотров за последние 7 дней">
                            <strong><?php echo \Statistics::countVisits($item->id,7); ?></strong> - <small>за 7 дней</small>
                        </button>
                        <button type="button" class="btn default count-visits" title="Просмотров за последние 30 дней">
                            <strong><?php echo \Statistics::countVisits($item->id,30); ?></strong> - <small>за 30 дней</small>
                        </button>
                        <button type="button" class="btn default count-visits" title="Просмотров всего">
                            <strong><?php echo \Statistics::countVisits($item->id,365); ?></strong> - <small>всего</small>
                        </button>
                    </div>
                    <div class="photo">
                        <a href="/service-item/view/<?php echo $item->id; ?>">
                            <img src="/timthumb.php?h=171&src=<?php echo $item->logo_src; ?>" />
                        </a>
                        <div class="pi-price">
                            <span class="price"><?php echo $item->price; ?> руб</span>
                            <span class="date"><i class="fa fa-tags"></i> <?php echo \DateFormat::displayWhen("$item->date_post"); ?></span>
                        </div>
                    </div>
                    <h3><a href="/service-item/view/<?php echo $item->id; ?>"><?php echo $item->title; ?></a></h3>
                    <div class="description" style="  margin-top: 45px;"><?php echo $item->short_description; ?></div>
                    <div class="navigation">
                        <a href="/service-item/view/<?php echo $item->id; ?>" class="btn btn-default add2cart">Подробнее</a>
                    </div>
                </div>
            </div>
            <!-- PRODUCT ITEM END -->
        <?php } ?>
    </div>
    <div class="clear"></div>
</div>
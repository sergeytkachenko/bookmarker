<div class="row list-view-sorting clearfix">
    <?php if ($this->length($page->items) > 0) { ?>
    <div class="col-md-2 col-sm-2 list-view">
        <a href="/product/view/1-item.html"><i class="fa fa-th-large"></i></a>
        <a href="/product/view/1-item.html"><i class="fa fa-th-list"></i></a>
    </div>
    <div class="col-md-10 col-sm-10">
        <form action="" method="get" id="list-control">
            <div class="pull-right">
                <label class="control-label">Показывать :</label>
                <select class="form-control input-sm" onchange="$('#list-control').submit();" name="countInPage">
                    <option value="3" <?php if ($countInPage == 3) { ?> selected <?php } ?>>3</option>
                    <option value="24" <?php if ($countInPage == 24) { ?> selected <?php } ?>>24</option>
                    <option value="50" <?php if ($countInPage == 50) { ?> selected <?php } ?>>50</option>
                    <option value="75" <?php if ($countInPage == 75) { ?> selected <?php } ?>>75</option>
                    <option value="100" <?php if ($countInPage == 100) { ?> selected <?php } ?>>100</option>
                </select>
            </div>
            <div class="pull-right">
                <label class="control-label">Сортировать по:</label>
                <select class="form-control input-sm" name="sortType"  onchange="$('#list-control').submit();">
                    <option value="1" <?php if ($sortType == 1) { ?> selected <?php } ?>>Имени (А - Я)</option>
                    <option value="2" <?php if ($sortType == 2) { ?> selected <?php } ?>>Имени (Я - А)</option>
                    <option value="3" <?php if ($sortType == 3) { ?> selected <?php } ?>>Цене (Меньше &gt; Больше)</option>
                    <option value="4" <?php if ($sortType == 4) { ?> selected <?php } ?>>Цене (Больше &gt; Меньше)</option>
                    <option value="5" <?php if ($sortType == 5) { ?> selected <?php } ?>>Дате (Старые сверху)</option>
                    <option value="6" <?php if ($sortType == 6) { ?> selected <?php } ?>>Дате (Новые сверху)</option>
                </select>
            </div>
        </form>
    </div>
    <?php } else { ?>
        <?php echo $this->partial('partials/items-null'); ?>
    <?php } ?>
</div>
<!-- BEGIN PRODUCT LIST -->
<div class="row product-list">
    <?php foreach ($page->items as $item) { ?>
    <!-- PRODUCT ITEM START -->
    <div class="col-md-12">
        <div class="product-item <?php if ($item->is_vip) { ?> vip <?php } ?>">
            <div class="photo">
                <a href="/service-item/view/<?php echo $item->id; ?>">
                    <img src="/timthumb.php?h=170&src=<?php echo $item->logo_src; ?>" />
                </a>
                <div class="pi-price">
                    <span class="price"><?php echo $item->price; ?> руб</span>
                    <span class="date"><i class="fa fa-tags"></i> <?php echo \DateFormat::displayWhen("$item->date_post"); ?></span>
                </div>
            </div>
            <h3><a href="/service-item/view/<?php echo $item->id; ?>"><?php echo $item->title; ?></a></h3>
            <div class="description"><?php echo $item->short_description; ?></div>
            <div class="navigation">

                <a href="/service-item/view/<?php echo $item->id; ?>" class="btn btn-default add2cart">Подробнее</a>
            </div>
        </div>
    </div>
    <!-- PRODUCT ITEM END -->
    <?php } ?>
</div>
<!-- END PRODUCT LIST -->

<?php if ($this->length($page->items) > 0 && $page->total_pages > 1) { ?>
<!-- BEGIN PAGINATOR -->
<div class="row">
    <!--                <div class="col-md-4 col-sm-4 items-info">Записей с 1 по 9, 10  всего</div>-->
    <div class="col-md-8 col-sm-8">
        <ul class="pagination pull-right">
            <li>
                <a href="#">&laquo;</a>
            </li>
            <?php foreach (range(1, $page->total_pages) as $index) { ?>
                <li <?php if ($page->current == $index) { ?>class="active"<?php } ?> >
                    <a href="?page=<?php echo $index; ?>"><?php echo $index; ?></a>
                </li>
            <?php } ?>
            <li>
                <a href="#">&raquo;</a>
            </li>
        </ul>
    </div>
</div>
<!-- END PAGINATOR -->
<?php } ?>
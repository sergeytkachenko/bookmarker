<?php foreach ($news as $n) { ?>
    <div class="row content-page" style="margin-bottom: 40px;">
        <div class="col-md-12 col-sm-12">
            <h2 style="text-align: left;"><a href="/news/view/<?php echo $n->id; ?>"><?php echo $n->title; ?></a></h2>
            <ul class="blog-info" style=" padding: 0; margin-left: 0; list-style: none">
                <li><i class="fa fa-calendar"></i> <?php echo \DateFormat::displayWhen("$n->date_create"); ?></li>
            </ul>
            <div>
                <?php echo $n->short_description; ?>
            </div>
            <a class="more" href="/news/view/<?php echo $n->id; ?>">Подробнее <i class="icon-angle-right"></i></a>
        </div>
    </div>
<?php } ?>
<?php if ($this->length($news) == 0) { ?>
    <?php echo $this->partial('partials/items-null'); ?>
<?php } ?>
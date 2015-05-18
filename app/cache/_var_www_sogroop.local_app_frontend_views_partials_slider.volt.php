<?php if ($this->length($sliderDivs) > 1) { ?>
<div class="container">
    <div class="page-slider margin-bottom-35">
        <div id="layerslider" style="width: 100%; height: 300px; margin: 0 auto;">
            <?php foreach ($sliderDivs as $sliderDiv) { ?>
                <?php echo $sliderDiv->content; ?>
            <?php } ?>
        </div>
    </div>
</div>
<?php } ?>
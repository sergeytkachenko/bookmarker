<?php if ($topMenuEnable == 1) { ?>
<div class="pre-header" style="padding: 0;">
    <div class="container">
        <ul class="nav navbar-nav center">
            <?php foreach ($topMenuList as $topMenu) { ?>
            <li><a href="<?php echo $topMenu->url; ?>"><?php echo $topMenu->title; ?></a></li>
            <?php } ?>
        </ul>
    </div>
</div>
<?php } ?>
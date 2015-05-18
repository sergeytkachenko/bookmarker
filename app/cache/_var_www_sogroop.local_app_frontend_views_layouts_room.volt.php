<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>Свадьба</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.png">
    <link href="/favicon.png" rel="SHORTCUT ICON" type="image/ico">

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&subset=all" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/css/default-bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/plugins/layerslider/css/layerslider.css" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/custom.css" rel="stylesheet" type="text/css">

    <!-- Theme styles END -->

    <link href="/assets-admin/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>

    <link href="/css/style.css" rel="stylesheet" type="text/css">
    

    <link href="/css/color.css" rel="stylesheet" type="text/css">


    <link href="/assets-admin/plugins/dropzone/css/dropzone.css" rel="stylesheet"/>
    <link href="/html/metronic/admin/template/assets/css/pages/inbox.css" rel="stylesheet"/>

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="/assets/plugins/respond.min.js"></script>
    <![endif]-->
    <script src="/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
<?= $this->partial("partials/first-header"); ?>
<?= $this->partial("partials/pre-header"); ?>
<?= $this->partial("partials/menu"); ?>

<div class="main">
    <div class="container">
        <?= $this->partial("partials/breadcrumb"); ?>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <?= $this->partial("partials/left-menu-user"); ?>
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-9">
                <?php echo $this->getContent(); ?>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<?= $this->partial("partials/footer"); ?>

<?php echo $this->partial('partials/footer-js'); ?>
</body>
<!-- END BODY -->
</html>
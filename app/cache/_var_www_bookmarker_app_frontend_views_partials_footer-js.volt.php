
<!-- Load javascripts at bottom, this will reduce page load time -->
<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script><!-- pop up -->
<script type="text/javascript" src="/assets/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
<script type="text/javascript" src='assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
<script src="/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<!-- END LayerSlider -->

<script src="/assets-admin/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="/assets-admin/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
<script src="/assets-admin/plugins/jquery.sparkline.min.js" type="text/javascript"></script>

<script type="text/javascript" src="/assets/scripts/app.js"></script>
<script type="text/javascript" src="/assets/scripts/index.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initBxSlider();
        Index.initLayerSlider(App);
        Index.initCalendar(App);
        App.initImageZoom();
        App.initTouchspin();
        //App.initSliderRange();
    });
</script>

<script type="text/javascript" src="/js/main.js"></script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
<!-- Start SiteHeart code -->
<script>
    (function(){
        var widget_id = 771565;
        _shcp =[{widget_id : widget_id}];
        var lang =(navigator.language || navigator.systemLanguage
        || navigator.userLanguage ||"en")
                .substr(0,2).toLowerCase();
        var url ="widget.siteheart.com/widget/sh/"+ widget_id +"/"+ lang +"/widget.js";
        var hcc = document.createElement("script");
        hcc.type ="text/javascript";
        hcc.async =true;
        hcc.src =("https:"== document.location.protocol ?"https":"http")
        +"://"+ url;
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hcc, s.nextSibling);
    })();
</script>
<!-- End SiteHeart code -->
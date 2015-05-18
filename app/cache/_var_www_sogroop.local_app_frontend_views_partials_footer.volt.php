<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN BOTTOM ABOUT BLOCK -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>О нас</h2>
                <div>
                    <?php echo $aboutAsFooter; ?>
                </div>
            </div>
            <!-- END BOTTOM ABOUT BLOCK -->
            <!-- BEGIN BOTTOM INFO BLOCK -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>Информация</h2>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i> <a href="/page/view/3">Описание услуг</a></li>
                    <?php foreach ($footerLinks as $footerLink) { ?>
                        <li><i class="fa fa-angle-right"></i> <a href="<?php echo $footerLink->url; ?>"><?php echo $footerLink->title; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <!-- END INFO BLOCK -->
            <!-- BEGIN TWITTER BLOCK -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>Последние Новости</h2>
                <ul class="list-unstyled">
                    <?php foreach ($lastNews as $news) { ?>
                        <li><i class="fa fa-angle-right"></i> <a href="/news/view/<?php echo $news->id; ?>"><?php echo $news->title; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <!-- END TWITTER BLOCK -->
            <!-- BEGIN BOTTOM CONTACTS -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>Наши контакты</h2>
                <address class="margin-bottom-40">
                    <?php echo $address; ?><br>
                    Россия, RUS<br>
                    Телефон: <?php echo $phone; ?><br>
                    Факс: <?php echo $fax; ?><br>
                    Email: <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?> </a><br>
                    Skype: <a href="skype:<?php echo $userSkype; ?>"><?php echo $userSkype; ?> </a>
                </address>
            </div>
            <!-- END BOTTOM CONTACTS -->
        </div>
        <hr>
        <div class="row">
            <!-- BEGIN SOCIAL ICONS -->
            <div class="col-md-6 col-sm-6">
                <ul class="social-icons">
                    <li><a class="facebook" data-original-title="facebook" href="<?php echo $facebook; ?>"></a></li>
                    <li><a class="twitter" data-original-title="twitter" href="<?php echo $twitter; ?>"></a></li>
                    <li><a class="googleplus" data-original-title="googleplus" href="<?php echo $google; ?>"></a></li>
                    <li><a class="linkedin" data-original-title="linkedin" href="<?php echo $linkedin; ?>"></a></li>
                    <li><a class="youtube" data-original-title="youtube" href="<?php echo $youtube; ?>"></a></li>
                    <li><a class="skype" data-original-title="skype" href="<?php echo $skype; ?>"></a></li>
                </ul>
            </div>
            <!-- END SOCIAL ICONS -->
            <!-- BEGIN NEWLETTER -->
            <div class="col-md-6 col-sm-6">
                <div class="pre-footer-subscribe-box pull-right">
                    <h2>Подписка на новости</h2>
                    <form action="#" onsubmit="alert('Ваш email успешно подписан на рассылку!')">
                        <div class="input-group">
                            <input type="email2"  placeholder="youremail@mail.com" class="form-control">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">Подписаться</button>
                  </span>
                        </div>
                    </form>
                </div>
            </div>
            <!-- END NEWLETTER -->
        </div>
    </div>
</div>
<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer padding-top-15">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10">
                2015 © www.sogroup.com. Все права защищены.
            </div>
            <!-- END COPYRIGHT -->
            <!-- BEGIN PAYMENTS -->
            <div class="col-md-6 col-sm-6">
                <ul class="list-unstyled list-inline pull-right margin-bottom-15">
                    <li><img src="/assets/img/payments/western-union.jpg" alt="We accept Western Union" title="We accept Western Union"></li>
                    <li><img src="/assets/img/payments/american-express.jpg" alt="We accept American Express" title="We accept American Express"></li>
                    <li><img src="/assets/img/payments/MasterCard.jpg" alt="We accept MasterCard" title="We accept MasterCard"></li>
                    <li><img src="/assets/img/payments/PayPal.jpg" alt="We accept PayPal" title="We accept PayPal"></li>
                    <li><img src="/assets/img/payments/visa.jpg" alt="We accept Visa" title="We accept Visa"></li>
                </ul>
            </div>
            <!-- END PAYMENTS -->
        </div>
    </div>
</div>
<!-- END FOOTER -->


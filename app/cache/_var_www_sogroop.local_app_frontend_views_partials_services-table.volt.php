<div class="table-responsive">
    <h4>Описание доступных услуг</h4>
    <table class="table table-bordered">
        <tr class="active">
            <th>Услуга</th>
            <th class="alignc">Max. к-во фото</th>
            <th class="alignc">Max. к-во видео</th>
            <th class="alignc">К-во символов в описании</th>
            <th class="alignc">Размещение в блоке ТОП</th>
            <th class="alignc">Дополнительно</th>
            <th class="alignc">Стоимость в руб.</th>
        </tr>
        <tr>
            <td>Бессплатное размещение</td>
            <td class="alignc"><?php echo $maxCountPhoto; ?></td>
            <td class="alignc"><?php echo $maxCountVideo; ?></td>
            <td class="alignc"><?php echo $maxLengthDescription; ?></td>
            <td class="alignc">-</td>
            <td class="alignc">-</td>
            <td class="alignc">-</td>
        </tr>
        <tr>
            <td>Реместить обьявление как ВИП</td>
            <td class="alignc"><b>Не ограничено</b></td>
            <td class="alignc"><b>Не ограничено</b></td>
            <td class="alignc"><b>Не <br>ограничено</b></td>
            <td class="alignc">Да</td>
            <td class="alignc"><b>Выделение анкеты</b></td>
            <td class="alignc"><?php echo $priceVip; ?> </td>
        </tr>
        <tr>
            <td>Поднятие анкеты на первое место</td>
            <td class="alignc">-</td>
            <td class="alignc">-</td>
            <td class="alignc">-</td>
            <td class="alignc">-</td>
            <td class="alignc">-</td>
            <td class="alignc"><?php echo $priceUp; ?></td>
        </tr>
    </table>
</div>
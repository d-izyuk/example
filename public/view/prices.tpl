<?= $header; ?>
<? foreach ($products as $product) { ?>
    <script>
        $(document).ready(function(){
            var owl = $("[data-id=<?= $product['product_id']; ?>] .slider");
            owl.owlCarousel({
                autoplay: true,
                autoplaySpeed: 1000,
                items : 4,
                nav: false,
                dots: false,
                loop: true
            });
        });
    </script>
<? } ?>
    <section id="places" class="places">
        <? if ($type == 'Apart') { ?>
            <? foreach ($products as $product) { ?>
                <div class="place" data-id="<?= $product['product_id']; ?>">
                    <div class="left">
                        <div class="main_img">
                            <div class="img">
                                <img src="<?= DIR_IMAGE . $product['image']; ?>" alt="">
                            </div>
                        </div>
                        <div class="slider">
                            <? foreach ($product['thumb'] as $image) { ?>
                                <div class="img">
                                    <img src="<?= DIR_IMAGE . $image["look"]; ?>" alt="">
                                </div>
                            <? } ?>
                        </div>
                    </div>
                    <div class="right">
                        <h3 class="name"><?= $product['name']; ?></h3>

                        <p class="description"><span><?=$rooms?></span><span
                                    class="number"><?= $product['count_rooms']; ?></span></p>
                        <p class="count"><span><?=$roominess?></span><span
                                    class="number"><?= $product['quantity']; ?></span></p>
                        <? if (isset($product['double_bed'])) { ?>
                            <p class=""><span><?=$double_bed?></span><span
                                        class="number"><?= $product['double_bed']; ?></span></p>
                        <? } ?>

                        <? if (isset($product['sofa_bed_q']) && $product['sofa_bed_q'] == '1') { ?>
                            <p class=""><span><?=$sofa_bed?></span><span
                                        class="number"><?= $product['sofa_bed']; ?></span></p>
                        <? } ?>

                        <p><?= $product['description']; ?></p>

                        <p class="price"><span><?=$price?></span><span
                                    class="number"><?= $product['price']; ?></span><?=$uah?><?=$per_day?></p>
                        <a href="javascript:void(0)" class="order"><?=$order?></a>
                    </div>
                </div>
            <?php } ?>
        <? } ?>
        <? if ($type == 'Hostel') { ?>
            <? foreach ($products as $product) { ?>
                <div class="place" data-id="<?= $product['product_id']; ?>">
                    <div class="left">
                        <div class="main_img">
                            <img src="<?= DIR_IMAGE . $product['image']; ?>" alt="">
                        </div>
                        <div class="slider">
                            <? foreach ($product['thumb'] as $image) { ?>
                                <div class="img">
                                    <img src="<?= DIR_IMAGE . $image["look"]; ?>" alt="">
                                </div>
                            <? } ?>
                        </div>
                    </div>
                    <div class="right">
                        <h3 class="name"><?= $product['name']; ?></h3>
                        <p class="description"><span><?=$in_room?></span><?= $product['description']; ?></p>
                        <p class="count"><span><?=$number_of_seats?></span><span
                                    class="number"><?= $product['quantity']; ?></span></p>

                        <? if (isset($product['room_or_place']) && $product['room_or_place'] == '1') { ?>
                            <p class="price"><span><?=$price_for_person_rer_night?></span><span
                                        class="number"><?= $product['price']; ?></span><?=$uah?></p>
                        <? } ?>

                        <? if (isset($product['room_or_place']) && $product['room_or_place'] == '0') { ?>
                            <p class="price"><span><?=$price_for_whole_room?></span> <span
                                        class="number"><?= $product['price']; ?></span><?=$uah?></p>
                        <? } ?>


                        <a href="javascript:void(0)" class="order"><?=$order?></a>
                    </div>
                </div>
            <?php } ?>
        <? } ?>
    </section>
    <div class="modal">
        <div class="backgr"></div>
        <div class="window order_window inputModal">
            <a href="javascript:void(0)" class="close"></a>
            <div class="fields">
                <div class="label">
                    <label for="room"><?=$room_type?></label>
                    <div class="label_inner">
                        <p class="spec_value"></p>
                        <select name="room" id="room">
                            <? if ($type == 'Apart') { ?>
                                <? foreach ($products as $product) { ?>
                                    <option value="<?= $product['product_id']; ?>"><?= $product['name']; ?></option>
                                <?php } ?>
                            <? } ?>
                            <? if ($type == 'Hostel') { ?>
                                <? foreach ($products as $product) { ?>
                                    <option value="<?= $product['product_id']; ?>"><?= $product['name']; ?></option>
                                <?php } ?>
                            <? } ?>
                        </select>
                    </div>
                </div>
                <div class="cols">
                    <label for="date_in" class="input-group date"><?=$date_in?> <input type="text" class="form-control datepicker" id="date_in"></label>
                    <label for="time_in"><?=$time?> <input name="time_in" id="time_in" type="number"></label>
                </div>
                <div class="cols">
                    <label for="date_out" class="input-group date"><?=$date_out?> <input name="date_out" type="text" class="form-control datepicker2" id="date_out"></label>
                    <label for="time_out"><?=$time?> <input name="time_out" id="time_out" type="number"></label>
                </div>
                <div class="input_row_wrap">
                    <label for="count"><?=$count?> <input name="count" id="count" type="number"></label>
                </div>
                <div class="input_row_wrap">
                    <label for="name"><?=$name?> <input name="name" id="name" type="text" placeholder=""></label>
                </div>
                <div class="input_row_wrap">
                    <label for="mail"><?=$mail?> <input name="mail" id="mail" type="text" placeholder=""></label>
                </div>
                <div class="input_row_wrap">
                    <label for="phone"><?=$phone?> <input name="phone" id="phone" type="text" placeholder="XXXXXXXXXX"></label>
                </div>
                <a href="javascript:void(0)" class="show"><?=$order?></a>
            </div>
            <div class="ico">
                <div class="inner_sircle">
                    <b>P</b>
                    <b>a</b>
                    <b>r</b>
                    <b>k</b>
                    <b>p</b>
                    <b>l</b>
                    <b>u</b>
                    <b>s</b>
                    <b>g</b>
                    <b>r</b>
                    <b>o</b>
                    <b>u</b>
                    <b>p</b>
                    <b>•</b>
                    <b>P</b>
                    <b>a</b>
                    <b>r</b>
                    <b>k</b>
                    <b>p</b>
                    <b>l</b>
                    <b>u</b>
                    <b>s</b>
                    <b>g</b>
                    <b>r</b>
                    <b>o</b>
                    <b>u</b>
                    <b>p</b>
                    <b>•</b>
                    <p>-5%<br><span><?=$discount?></span></p>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.show').click(function () {

                var fail = true;
                var room_id = $('#room option:selected').attr('value');
                var date_in = $('#date_in').val();
                var time_in = $('#time_in').val();
                var date_out = $('#date_out').val();
                var time_out = $('#time_out').val();
                var count = $('#count').val();
                var name = $('#name').val();
                var mail = $('#mail').val();
                var phone = $('#phone').val();
                var email_mask = /[\w_.-]+@[0-9a-z_-]+\.[a-z]{2,5}/i;
                var mob_mask = /[0-9]{10}/;

                if (room_id == '') {
                    $('#room').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#room').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (date_in == '' || date_in == null || date_in.length < 3) {
                    $('#date_in').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#date_in').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (time_in == '' || time_in == null || time_in.length < 2) {
                    $('#time_in').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#time_in').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (date_out == '' || date_out == null || date_out.length < 3) {
                    $('#date_out').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#date_out').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (time_out == '' || time_out == null || time_out.length < 2) {
                    $('#time_out').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#time_out').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (count == '' || count == null) {
                    $('#count').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#count').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (name == '' || name == null || name.length < 3) {
                    $('#name').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#name').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (email_mask.test(mail) == false) {
                    $('#mail').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#mail').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                if (mob_mask.test(phone) == false) {
                    $('#phone').css({
                        'box-shadow': '0px 0px 5px 3px rgb(255, 2, 2)'
                    });
                    fail = false;
                } else {
                    $('#phone').css({
                        'box-shadow': '0px 0px 5px 3px rgba(255, 2, 2, 0)'
                    });
                }

                <? if ($type == 'Apart') { ?>
                var message = '<?=$mail_a?>';
                <?}?>

                <? if ($type == 'Hostel') { ?>
                var message = '<?=$mail_h?>';
                <?}?>

                var confirmation = '<?=$confirm?>';
                var language = '<?=$l_id["language_id"]?>';

                var data = {
                    room_id: room_id,
                    date_in: date_in,
                    time_in: time_in,
                    date_out: date_out,
                    time_out: time_out,
                    count: count,
                    name: name,
                    mail: mail,
                    phone: phone,
                    message: message,
                    confirmation: confirmation,
                    language: language
                }
                if (fail == true) {
                    $.ajax({
                        url: '/index.php?route=common/reservation/addOrder',
                        type: 'POST',
                        data: data,
                        success: function (res) {
                            window.location.href = '<?=$last?>';
                        }
                    })
                }
            });
        })
    </script>
<?= $footer; ?>
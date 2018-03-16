<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <!--<div class="pull-right"><a href="<?php /*echo $add; */ ?>" data-toggle="tooltip" title="<?php /*echo $button_add; */ ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a> <a href="<?php /*echo $reservations; */ ?>" data-toggle="tooltip" title="<?php /*echo $button_rebuild; */ ?>" class="btn btn-default"><i class="fa fa-refresh"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php /*echo $button_delete; */ ?>" class="btn btn-danger" onclick="confirm('<?php /*echo $text_confirm; */ ?>') ? $('#form-category').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>-->
                <!--<h1><?php /*echo $heading_title; */?></h1>-->
                <ul class="breadcrumb">
                    <?php /*/*foreach ($breadcrumbs as $breadcrumb) { */?><!--
                        <li><a href="<?php /*/*echo $breadcrumb['href']; */?>"><?php /*/*echo $breadcrumb['text']; */?></a></li>
                    --><?php /*/*} */?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php /*if ($error_warning) { */?><!--
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php /*echo $error_warning; */?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            --><?php /*} */?>
            <?php /*if ($success) { */?><!--
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php /*echo $success; */?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            --><?php /*} */?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data"
                          id="form-category">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>

                                    <th class="text-center">Номер бронювання</th>
                                    <th class="text-center">Дата бронювання</th>
                                    <th class="text-center">Заброньованих місць</th>
                                    <th class="text-center">Кімната</th>
                                    <th class="text-center">Дата заїзду</th>
                                    <th class="text-center">Дата виїзду</th>
                                    <th class="text-center">Ім'я</th>
                                    <th class="text-center">Телефон</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Статус</th>
                                    <th class="text-center">Дія</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($reservations) { ?>
                                    <?php foreach ($reservations as $reservation) { ?>
                                        <tr lang="<?=$reservation['lang']?>">
                                            <td class="text-center id"><?= $reservation['id'] ?></td>
                                            <td class="text-center "><?= $reservation['order_date'] ?></td>
                                            <td class="text-center"><?= $reservation['res_count_places'] ?></td>
                                            <td class="text-center"><?= $reservation['model'].' / '.$reservation['room_id'] ?></td>
                                            <td class="text-center in"><span class="date_in"><?= $reservation['date_in'] ?></span>
                                                [<span class="time_in"><?= $reservation['time_start'] ?></span>]
                                            </td>
                                            <td class="text-center out"><span class="date_out"><?= $reservation['date_out'] ?></span>
                                                [<span class="time_out"><?= $reservation['time_end'] ?></span>]
                                            </td>
                                            <td class="text-center name"><?= $reservation['name'] ?></td>
                                            <td class="text-center"><?= $reservation['phone'] ?></td>
                                            <td class="text-center mail"><?= $reservation['email'] ?></td>
                                            <?if($reservation['status'] == '0'){
                                                $messsage = 'Потребує підтвердження';

                                                $html = '<a href="javascript:void(0);" data-toggle="tooltip" title="" style="margin-bottom: 10px;" class="btn btn-success">Підтвердити</a><a href="javascript:void(0);" data-toggle="tooltip" title="" class="btn btn-default">Відхилити</a>';
                                            } elseif ($reservation['status'] == '1'){
                                                $messsage = 'Підтверджено';
                                                $html = '<a href="javascript:void(0);" data-toggle="tooltip" title="" class="btn btn-danger">Видалити</a>';
                                            } elseif ($reservation['status'] == '2'){
                                                $messsage = 'Відхилено';
                                                $html = '<a href="javascript:void(0);" data-toggle="tooltip" title="" class="btn btn-danger">Видалити</a>';
                                            }?>
                                            <td class="text-center"><?= $messsage ?></td>
                                            <td class="text-center"><?= $html ?></td>

                                        </tr>
                                    <?php } ?>
                                <?php } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </form>
<!--                    <div class="row">-->
<!--                        <div class="col-sm-6 text-left">--><?php //echo $pagination; ?><!--</div>-->
<!--                        <div class="col-sm-6 text-right">--><?php //echo $results; ?><!--</div>-->
<!--                    </div>-->
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.btn-success').click(function () {
            var name = $(this).closest('td').prevAll('.name').text();
            var id = $(this).closest('td').prevAll('.id').text();
            var mail = $(this).closest('td').prevAll('.mail').text();
            var date_in = $(this).closest('td').prevAll('.in').find('.date_in').text();
            var time_in = $(this).closest('td').prevAll('.in').find('.time_in').text();
            var date_out = $(this).closest('td').prevAll('.out').find('.date_out').text();
            var time_out = $(this).closest('td').prevAll('.out').find('.time_out').text();
            var lang = $(this).closest('tr').attr('lang');

            var data = {
                name: name,
                id: id,
                mail: mail,
                date_in: date_in,
                time_in: time_in,
                date_out: date_out,
                time_out: time_out,
                lang: lang
            }
            $.ajax({
                url: 'index.php?route=catalog/reservations/confirm&token=<?=$token?>',
                type: 'POST',
                data: data,
                success: function (res) {
                    location.reload();
                }
            })
        })
        $('.btn-default').click(function () {
            var name = $(this).closest('td').prevAll('.name').text();
            var mail = $(this).closest('td').prevAll('.mail').text();
            var id = $(this).closest('td').prevAll('.id').text();
            var lang = $(this).closest('tr').attr('lang');

            var data = {
                name: name,
                id: id,
                mail: mail,
                lang: lang
            }
            $.ajax({
                url: 'index.php?route=catalog/reservations/declined&token=<?=$token?>',
                type: 'POST',
                data: data,
                success: function (res) {
                    location.reload();
                }
            })
        })
        $('.btn-danger').click(function () {
            var id = $(this).closest('td').prevAll('.id').text();
            var data = {
                id: id
            }
            $.ajax({
                url: 'index.php?route=catalog/reservations/delete&token=<?=$token?>',
                type: 'POST',
                data: data,
                success: function (res) {
                    location.reload();
                }
            })
        })
    </script>
<?php echo $footer; ?>